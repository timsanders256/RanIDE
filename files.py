import json, os

file_base = os.path.abspath(os.path.dirname(__file__))



def getLabel(path):
    pos = 0
    for i in range(len(path)-1,-1,-1):
        if path[i] == "/" or path[i] == "\\":
            pos = i
            break
    return path[pos + 1:]

def getType(path):
    pos = 0
    for i in range(len(path)-1,-1,-1):
        if path[i] == ".":
            pos = i
            break
    return path[pos + 1:]

def getFormer(path):
    pos = 0
    for i in range(len(path)-1,-1,-1):
        if path[i] == "/" or path[i] == "\\":
            pos = i
            break
    return path[:pos + 1]

def getChild(path, res):
    for i in os.listdir(path):
        temp_dir = os.path.join(path, i)
        temp_label = getLabel(temp_dir)
        if os.path.isdir(temp_dir):
            temp = {
                    "path": temp_dir, 
                    'children': [], 
                    'type':'dir',
                    'label':temp_label,
                    'lang':getType(temp_label)
                    }
            res['children'].append(getChild(temp_dir, temp))
        else:
            res['children'].append({'path':temp_dir,"children":[],'type':'file','label':temp_label,'lang':getType(temp_label)})
    return res

def getFiletrees(project_name):
    root = {
            'path': file_base +f"/workspace/"+project_name,
            'children':[],
            'type':'dir',
            'label':project_name,
            'lang':''
            }
    print(project_name)
    return getChild(file_base +f"/workspace/"+project_name, root)   

def rename(path,newname):
    os.rename(path,getFormer(path) + newname + "." +getType(path))

def rename_dir(path,newname):
    os.rename(path,getFormer(path) + newname)