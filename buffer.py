# Please utilize threading lock 

class bufferSingular():
    def __init__(self) -> None:
        self.bufferDownstream = []
        self.bufferUpstream = []

    def regDownstream(self, down_str):
        if(not isinstance(down_str, str)):
            return False
        self.bufferDownstream.append(down_str)
        return True

    def getDownstream(self):
        if(len(self.bufferDownstream)):
            return self.bufferDownstream.pop(0)
        else:
            return None

    def regUpstream(self, up_str):
        if(not isinstance(up_str, str)):
            return False
        self.bufferUpstream.append(up_str)
        return True

    def getUpstream(self):
        if(len(self.bufferUpstream)):
            return self.bufferUpstream.pop(0)
        else:
            return None
