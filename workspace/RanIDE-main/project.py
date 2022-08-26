
import os
import shutil
import datetime
import json

file_base = os.path.abspath(os.path.dirname(__file__))

def create_proj(name='proj', creator='user'):
    global file_base
    if os.path.exists(f'workspace\\'+name):
        print("existing project!")
    else:
        tmp = {
            'name':name,
            'creator':creator,
            'createdDate':datetime.date.today().strftime('%m/%d/%Y')
        }
        os.mkdir(f'workspace\\'+name)
        path = f'myProject.json'
        with open(path, 'r') as f_obj:
            proj_list = json.load(f_obj)
        proj_list.append(tmp)
        tf = open("myProject.json", "w")
        json.dump(proj_list,tf)
        tf.close()

def rename_proj(oldname,newname):
    print(oldname, newname)
    global file_base
    path = f'myProject.json'
    with open(path, 'r') as f_obj:
        proj_list = json.load(f_obj)
    if os.path.exists(f'workspace\\' + newname):
        print("existing project!")
    else:
        for proj in proj_list:
            if proj['name'] == oldname:
                proj['name'] = newname

        tf = open(f"myProject.json", "w")
        json.dump(proj_list,tf)
        tf.close()
        os.rename(f'workspace\\'+ oldname, f'workspace\\'+ newname)


def delete_proj(todeleteName):
    global file_base
    shutil.rmtree(f'workspace\\'+ todeleteName)
    path = f'myProject.json'
    with open(path, 'r') as f_obj:
        proj_list = json.load(f_obj)
    for proj in proj_list:
        if proj['name'] == todeleteName:
            proj_list.remove(proj)

    tf = open(file_base +  f"myProject.json", "w")
    json.dump(proj_list,tf)
    tf.close()

    print("proj_deleted")