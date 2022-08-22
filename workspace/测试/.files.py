import pdb
pdb.set_trace()
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
        if('__pycache__' in temp_dir):
            continue
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
            if('.' != temp_dir.rsplit('\\', 1)[1][0]):                  
                if temp_dir[-3:] == ".py":
                    res['children'].append({'path':temp_dir,"children":[],'type':'python','label':temp_label,'lang':getType(temp_label)})
                elif temp_dir[-3:] == ".md":
                    res['children'].append({'path':temp_dir,"children":[],'type':'markdown','label':temp_label,'lang':getType(temp_label)})
                elif temp_dir[-3:] == ".js":
                    res['children'].append({'path':temp_dir,"children":[],'type':'javascript','label':temp_label,'lang':getType(temp_label)})
                elif temp_dir[-4:] == ".bat":
                    res['children'].append({'path':temp_dir,"children":[],'type':'bat','label':temp_label,'lang':getType(temp_label)})
                elif temp_dir[-4:] == ".lua":
                    res['children'].append({'path':temp_dir,"children":[],'type':'lua','label':temp_label,'lang':getType(temp_label)})
                else:
                    res['children'].append({'path':temp_dir,"children":[],'type':'file','label':temp_label,'lang':getType(temp_label)})
    return res

def getFiletrees(project_name):
    root = {
            'path': f"workspace\\"+project_name,
            'children':[],
            'type':'dir',
            'label':project_name,
            'lang':''
            }
    print(project_name)
    return getChild(f"workspace\\"+project_name, root)   

def rename(path,newname):
    os.rename(path, getFormer(path) + newname)

def rename_dir(path,newname):
    os.rename(path, getFormer(path) + newname)