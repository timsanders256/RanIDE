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
        for _ in range(10):
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
        self.p = Popen([functype, dir],
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
        
    def input_str(self, str_in):
        if(self.p.poll() is not None):
            return
        self.p.stdin.write(str_in+'\n')
        self.p.stdin.flush()
    
    def kill(self):
        self.p.terminate()
    
    def state_running(self):
        if(self.p.poll() is not None):
            return False
        return True
    
    def get_output(self):
        try: 
            line = self.queue.get_nowait()
        except Empty:
            return 0
        else:
            if(line == '' and self.p.poll() is not None):
                return -1
            return line
    
    def get_errmsg(self):
        try: 
            line = self.errqueue.get_nowait()
        except Empty:
            return 0
        else:
            if(line == '' and self.p.poll() is not None):
                return -1
            return line
