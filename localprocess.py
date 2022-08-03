from subprocess import Popen,PIPE, STDOUT
#import subprocess
import time
class process():
    def __init__(self,  dir, functype="python") -> None:
        self.p = Popen([functype, dir],
                       stdin=PIPE,
                       stdout=PIPE,
                       stderr=PIPE,
                       encoding='utf-8')
        
    def input_str(self, str_in):
        if(self.p.poll() is not None):
            return
        self.p.stdin.write(str_in+'\n')
        self.p.stdin.flush()
    
    def get_output(self):
        line = self.p.stdout.readline()
        if(line == '' and self.p.poll() is not None):
            return ''
        return line.strip()
