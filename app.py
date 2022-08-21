from flask import Flask, jsonify, render_template, request, redirect, url_for, session, json, make_response
import localprocess
import project
import files
import os
import shutil
from werkzeug.routing import BaseConverter
class RegexConverter(BaseConverter):
    def __init__(self, url_map, *items):
        super(RegexConverter, self).__init__(url_map)
        self.regex = items[0]

taskmgr = {}
# file_base_forjson = os.path.abspath(os.path.dirname(__file__))
app = Flask(__name__)
app.url_map.converters['regex'] = RegexConverter

def saveCodeFunc(path, code):
    with open(path, 'w+', encoding='utf-8') as f:
            code = code.split('\r')
            f.writelines(code)
    return 'done'

@app.route('/runCode', methods=['GET', 'POST'])
def runCode():
    global taskmgr
    if request.method == 'POST':
        # path = request.get_json()['filename']
        path = request.get_json()['filename']
        mycode = request.get_json()['code']
        type = request.get_json()['type']
        saveCodeFunc(path, mycode)
        if path in taskmgr.keys():
            taskmgr[path].kill()
        taskmgr.pop(path, None)        
        taskmgr[path] = localprocess.process(path, type)
        return 'done'

@app.route('/saveCode', methods=['GET', 'POST'])
def saveCode():
    if request.method == 'POST':
        # path = request.get_json()['filename']
        path = request.get_json()['filename']
        mycode = request.get_json()['code']
        saveCodeFunc(path, mycode)
        return 'done'

@app.route('/killCode', methods=['GET', 'POST'])
def killCode():
    if request.method == 'POST':
        # path = request.get_json()['filename']
        path = request.get_json()['filename']
        if(path in taskmgr.keys()):
            taskmgr[path].kill()
            # taskmgr.pop(path, None)
            return 'done'
        else:
            return 'err'

@app.route('/debugCode', methods=['GET', 'POST'])
def debugCode():
    global taskmgr
    if request.method == 'POST':
        if(request.get_json()['type'] == 'python'):
            path = request.get_json()['filename']
            dir_list = request.get_json()['filename'].split('\\')
            debugpath = 'debug'
            for item in dir_list:
                debugpath = debugpath + '\\' + item
                if item == dir_list[len(dir_list)-1]:
                    break
                if not os.path.exists(debugpath):
                    os.mkdir(debugpath)
            # debugpath = 'debug\\' + request.get_json()['filename']
            mycode = request.get_json()['code']
            type = request.get_json()['type']
            breakpoints = request.get_json()['breakpoints'].split(',')
            old = mycode
            if breakpoints[0] == '':
                pass
            else:
                mycode = 'import pdb\npdb.set_trace()\n'+mycode
            saveCodeFunc(path, old)
            saveCodeFunc(debugpath,mycode)
            # 加入断点后开始运行
            if path in taskmgr.keys():
                taskmgr[path].kill()
            taskmgr.pop(path, None)        
            taskmgr[path] = localprocess.process(debugpath, type)
            return 'done'
        else:
            pass
'''
@app.route('/<regex(".*"):filename>/edit')
def editorRenderer(filename):
    arg = {
        'filename': filename
    }
    return render_template('index.html', arg=arg)    
'''

# getCode
@app.route('/getCode', methods=['POST', 'GET'])
def getCode():
    if request.method == 'POST':
        path = request.get_json()['filename']
        print(path)
        with open(path, 'r', encoding='utf-8') as f:
            code = f.read()
        print(code)
        return code

# inputProcess，outputProcess函数为测试代码，后端可删除
# input process
@app.route('/input', methods=['POST', 'GET'])
def inputProcess():
    if request.method == 'POST':
        # path = request.get_json()['filename']
        path = request.get_json()['filename']
        input_str = request.get_json()['input']
        if(path in taskmgr.keys()):
            taskmgr[path].input_str(input_str)
            print(input_str)
            return 'done'
    return 'err'

# output process
@app.route('/output', methods=['POST', 'GET'])
def outputProcess():
    global taskmgr
    if request.method == 'POST':
        # path = request.get_json()['filename']
        path = request.get_json()['filename']
        type_str = request.get_json()['type']
        result = {
            'value': '',
            'count': 0
        }
        if(path in taskmgr.keys()):
            if(type_str == 'output'):
                result['value'], result['count'] = taskmgr[path].get_output()
                if result['value'] != 0:
                    print(result['value'])
                return json.dumps(result)
            elif(type_str == 'errmsg'):
                result['value'], result['count'] = taskmgr[path].get_errmsg()
                return json.dumps(result)
    result['value'] = -1
    return json.dumps(result)

#临时代码编辑页
@app.route('/code', methods=['POST', 'GET'])
def code():
    if request.method == 'POST':
        projectname = request.get_json()["name"]
        print(projectname)
        #print(projectname.encode('utf-8'))
        return projectname
    elif request.method == 'GET':
        # return render_template('code.html')
        arg = {
            'filename': 'null'
        }
        return render_template('index.html', arg=arg)  
    

# 项目管理页面（首页）
@app.route('/', methods=['POST', 'GET'])
def projectmanagement():
    if request.method == 'POST':
        tmp = request.get_json()["name"]
        print(tmp)
        return 'done'
    elif request.method == 'GET':
        return render_template('projectManagement.html')

#项目管理页面获取项目列表
@app.route('/updateData', methods=["GET"])
def getProjects():
    # global file_base_forjson
    path = f'myProject.json'
    with open(path, 'r') as f_obj:
        proj_list = json.load(f_obj)
    a = len(proj_list)
    t = {
        'proj_num': a,
        'projs': proj_list
    }
    return jsonify(t)

# 创建新项目
@app.route('/createProj', methods=['POST', 'GET'])
def create_project():
    if request.method == 'POST':
        proj_name = request.get_json()['name']
        proj_creator = request.get_json()['creator']
        project.create_proj(proj_name, proj_creator)
        return render_template('projectManagement.html')

# 重命名项目
@app.route('/renameProj', methods=['POST', 'GET'])
def rename_project():
    if request.method == 'POST':
        old_name = request.get_json()['oldname']
        new_name = request.get_json()['newname']
        print(old_name, new_name)
        project.rename_proj(old_name, new_name)
        return render_template('projectManagement.html')

# 删除项目
@app.route('/deleteProj', methods=['POST', 'GET'])
def delete_project():
    if request.method == 'POST':
        proj_name = request.get_json()['name']
        project.delete_proj(proj_name)
        return render_template('projectManagement.html')


# 从后台获取文件树
@app.route('/getFiletree', methods=["POST"])
def getFiletree():
    project_name = request.get_json()['projectname']
    print(files.getFiletrees(project_name))
    return jsonify({'files':files.getFiletrees(project_name)})

# 下载文件
@app.route('/downloadFile', methods=['POST', 'GET'])
def downloadFile():
    if request.method == 'POST':
        path = request.get_json()['path']
        file = open(path, "rb").read()
        response = make_response(file)
        return response

# 重命名文件或文件夹
@app.route('/rename', methods=['POST', 'GET'])
def rename():
    if request.method == 'POST':
        filenode = request.get_json()['filenode']
        newname = request.get_json()['newname']
        path = filenode['path']
        if filenode['type'] == 'dir':
            files.rename_dir(path,newname)
        else:
            files.rename(path,newname)
        return ' '

# 删除文件或文件夹
@app.route('/remove', methods=['POST', 'GET'])
def remove():
    if request.method == 'POST':
        filenode = request.get_json()['filenode']
        path = filenode['path']
        if filenode['type'] == 'dir':
            shutil.rmtree(path)
        else:
            os.remove(path)
        return ' '

#新建文件夹
@app.route('/newdir', methods=['POST', 'GET'])
def newdir():
    if request.method == 'POST':
        print("newdir")
        filenode = request.get_json()['filenode']
        name = request.get_json()['name']
        path = filenode['path']
        newdir_path = path + '\\' + name
        if not os.path.exists(newdir_path):
            os.mkdir(newdir_path)
    return " "

#新建文件
@app.route('/newfile', methods=['POST', 'GET'])
def newfile():
    if request.method == 'POST':
        print("newdir")
        filenode = request.get_json()['filenode']
        name = request.get_json()['name']
        path = filenode['path']
        newfile_path = path + '\\' + name
        if not os.path.exists(newfile_path):
            newfile = open(newfile_path, 'w+')
            newfile.close()
    return " "

#上传文件
@app.route('/upload', methods=['POST', 'GET'])
def upload():
    if request.method == 'POST':
        print("upload")
        file = request.files['file']
        path = request.form['path']
        file.save(os.path.join(path, file.filename))
        return " "

if __name__ == '__main__':
    #app.run(debug=True, host="0.0.0.0")
    app.run(debug=True, use_reloader=False)