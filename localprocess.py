from subprocess import Popen, PIPE
from queue import Queue, Empty
from threading  import Thread
import sys

ON_POSIX = 'posix' in sys.builtin_module_names

def enqueue_output(out, queue):
    for line in iter(out.readline, b''):
        queue.put(line)
    out.close()

class process():
    def __init__(self,  dir, functype="python") -> None:
        self.p = Popen([functype, dir],
                       stdin=PIPE,
                       stdout=PIPE,
                       stderr=PIPE,
                       encoding='utf-8',
                       bufsize=1, close_fds=ON_POSIX)
        self.queue = Queue()
        self.thread = Thread(target=enqueue_output, args=(self.p.stdout, self.queue))
        self.thread.daemon = True
        self.thread.start()
        
    def input_str(self, str_in):
        if(self.p.poll() is not None):
            return
        self.p.stdin.write(str_in+'\n')
        self.p.stdin.flush()
    
    def state_running(self):
        if(self.p.poll() is not None):
            return False
        return True
    
    def get_output(self):
        try: 
            line = self.queue.get_nowait()
        except Empty:
            pass
            # no output yet
        else:
            return line.strip()
