from subprocess import Popen, PIPE
from functools import partial
from threading  import Thread, Lock
import sys
import os

ON_POSIX = 'posix' in sys.builtin_module_names
os.environ["PYTHONUNBUFFERED"] = "1"

class process():
    def __init__(self,  dir, functype="python") -> None:
        if(functype == "python"):
            func_exec = "python"
            self.p = Popen([func_exec, dir.rsplit('\\', 1)[1]],
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        universal_newlines=True,
                        shell=False,
                        cwd=dir.rsplit('\\', 1)[0],
                        close_fds=ON_POSIX)
        elif(functype == "lua"):
            func_exec = 'lua_Win32_bin\\lua52.exe'
            self.p = Popen([func_exec, dir.rsplit('\\', 1)[1]],
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        universal_newlines=True,
                        shell=False,
                        cwd=dir.rsplit('\\', 1)[0],
                        close_fds=ON_POSIX)
        elif(functype == "javac"):
            func_exec = 'javac'
            self.p = Popen([func_exec, '-g',dir.rsplit('\\', 1)[1]],
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        universal_newlines=True,
                        shell=False, 
                        cwd=dir.rsplit('\\', 1)[0],
                        close_fds=ON_POSIX)
            self.thread = Thread(target=self.get_output_stdout)
            self.errthread = Thread(target=self.get_output_stderr)
            self.thread.daemon = True
            self.errthread.daemon = True
            self.forceEnd = False
            self.counter = -1
            self.lock = Lock()
            self.stdout_str = ''
            self.stderr_str = ''
            return
        elif(functype == "java"):
            func_exec = 'java'
            self.p = Popen([func_exec,dir.rsplit('\\', 1)[1]],
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        universal_newlines=True,
                        shell=False, 
                        cwd=dir.rsplit('\\', 1)[0],
                        close_fds=ON_POSIX)
        elif(functype == "jdb"):
            func_exec = 'jdb'
            self.p = Popen([func_exec,dir.rsplit('\\', 1)[1]],
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        universal_newlines=True,
                        shell=False, 
                        cwd=dir.rsplit('\\', 1)[0],
                        close_fds=ON_POSIX)
        # elif(dir =="run"):
        #     self.p = Popen(dir,
        #                 stdin=PIPE,
        #                 stdout=PIPE,
        #                 stderr=PIPE,
        #                 bufsize=10,
        #                 universal_newlines=True,
        #                 shell=False,
        #                 close_fds=ON_POSIX)
        else:
            print(dir.rsplit('\\', 1)[1], dir.rsplit('\\', 1)[0])
            self.p = Popen(dir,
                        stdin=PIPE,
                        stdout=PIPE,
                        stderr=PIPE,
                        bufsize=10,
                        universal_newlines=True,
                        shell=False,
                        close_fds=ON_POSIX)
        self.thread = Thread(target=self.get_output_stdout)
        self.errthread = Thread(target=self.get_output_stderr)
        self.thread.daemon = True
        self.errthread.daemon = True
        self.thread.start()
        self.errthread.start()
        self.forceEnd = False
        self.counter = -1
        self.lock = Lock()
        self.stdout_str = ''
        self.stderr_str = ''
    
    def get_output_stdout(self):
        for b in iter(partial(self.p.stdout.read, 1), b""):
            if(b != ''):
                self.lock.acquire()
                self.stdout_str += b
                self.lock.release()
                
    def get_output_stderr(self):
        for b in iter(partial(self.p.stderr.read, 1), b""):
            if(b != ''):
                self.lock.acquire()
                self.stdout_str += b
                self.lock.release()
    
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
        self.lock.acquire()
        line = self.stdout_str
        self.stdout_str = ''
        self.lock.release()
        if(line != ''):
            self.counter = (self.counter + 1)#  % self.countermod
            return line, self.counter
        else:
            if(self.p.poll() is not None):
                if self.forceEnd == False:
                    return -1, 0
            return 0, 0
    
    def get_errmsg(self):
        self.lock.acquire()
        line = self.stderr_str
        self.stderr_str = ''
        self.lock.release()
        if(line != ''):
            self.counter = (self.counter + 1)#  % self.countermod
            return line, self.counter
        else:
            if(self.p.poll() is not None):
                if self.forceEnd == False:
                    return -1, 0
            return 0, 0
