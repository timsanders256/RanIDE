from subprocess import Popen, PIPE
from queue import Queue, Empty
from threading  import Thread
import sys
import os

ON_POSIX = 'posix' in sys.builtin_module_names
os.environ["PYTHONUNBUFFERED"] = "1"

def enqueue_output(out, queue):
    while True:
        line = ''
        for _ in range(100):
            chr = out.read(1)
            line += chr
            if(chr == b''):
                queue.put(line)
                queue.put('')
                out.close()
                return
            if(chr == '\n'):
                break
        queue.put(line)
    out.close()

class process():
    def __init__(self,  dir, functype="python") -> None:
        if(functype == "python" or functype == "lua"):
            if(functype == "lua"):
                func_exec = 'lua-5.4.2_Win32_bin\lua54.exe'
            else:
                func_exec = "python"
            self.p = Popen([func_exec, dir.rsplit('\\', 1)[1]],
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        encoding='utf-8',
                        shell=False,
                        cwd=dir.rsplit('\\', 1)[0],
                        close_fds=ON_POSIX)
        else:
            print(dir.rsplit('\\', 1)[1], dir.rsplit('\\', 1)[0])
            self.p = Popen(dir,
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        encoding='utf-8',
                        shell=False,
                        close_fds=ON_POSIX)
        self.queue = Queue()
        self.thread = Thread(target=enqueue_output, args=(self.p.stdout, self.queue))
        self.errqueue = Queue()
        self.errthread = Thread(target=enqueue_output, args=(self.p.stderr, self.errqueue))
        self.thread.daemon = True
        self.errthread.daemon = True
        self.thread.start()
        self.errthread.start()
        # self.countermod = 9999999
        self.forceEnd = False
        self.counter = -1
        
    def input_str(self, str_in):
        if(self.p.poll() is not None):
            return
        self.p.stdin.write(str_in+'\n')
        self.p.stdin.flush()
    
    def kill(self):
        self.forceEnd = True
        self.p.terminate()
    
    def state_running(self):
        if(self.p.poll() is not None):
            return False
        return True
    
    def get_output(self):
        try: 
            line = self.queue.get_nowait()
        except Empty:
            return 0, 0
        else:
            if(line == '' and self.p.poll() is not None):
                if self.forceEnd == False:
                    return -1, 0
                else:
                    return 0, 0
            self.counter = (self.counter + 1)#  % self.countermod
            return line, self.counter
    
    def get_errmsg(self):
        try: 
            line = self.errqueue.get_nowait()
        except Empty:
            return 0, 0
        else:
            if(line == '' and self.p.poll() is not None):
                if self.forceEnd == False:
                    return -1, 0
                else:
                    return 0, 0
            self.counter = (self.counter + 1) # % self.countermod
            return line, self.counter
