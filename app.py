from flask import Flask, jsonify, render_template, request, redirect, url_for, session, json
import localprocess
from werkzeug.routing import BaseConverter
class RegexConverter(BaseConverter):
    def __init__(self, url_map, *items):
        super(RegexConverter, self).__init__(url_map)
        self.regex = items[0]

taskmgr = {}
app = Flask(__name__)
app.url_map.converters['regex'] = RegexConverter

def saveCodeFunc(path, code):
    with open(path, 'w+') as f:
            code = code.split('\r')
            f.writelines(code)
    return 'done'

@app.route('/runCode', methods=['GET', 'POST'])
def runCode():
    global taskmgr
    if request.method == 'POST':
        path = 'code\\' +  request.get_json()['filename']
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
        path = 'code\\' +  request.get_json()['filename']
        mycode = request.get_json()['code']
        saveCodeFunc(path, mycode)
        return 'done'

@app.route('/killCode', methods=['GET', 'POST'])
def killCode():
    if request.method == 'POST':
        path = 'code\\' +  request.get_json()['filename']
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
        path = 'code\\' +  request.get_json()['filename']
        debugpath = 'debug\\' + request.get_json()['filename']
        mycode = request.get_json()['code']
        type = request.get_json()['type']
        # 当前断点集合为字符串组成的列表（行数从1开始）
        breakpoints = request.get_json()['breakpoints'].split(',')
        # 在断点位置处加入pdb.set_trace()
        if breakpoints[0] == '':
            breakpoints = []
        else:
            breakpoints = [int(x) for x in breakpoints]
        old = mycode
        mycode = mycode.split('\n')
        for i in breakpoints:
            mycode.insert(i-1,'pdb.set_trace()')
        mycode = '\n'.join(mycode)
        mycode = 'import pdb\n'+mycode
        saveCodeFunc(path, old)
        saveCodeFunc(debugpath,mycode)
        # 加入断点后开始运行
        if path in taskmgr.keys():
            taskmgr[path].kill()
        taskmgr.pop(path, None)        
        taskmgr[path] = localprocess.process(debugpath, type)
        return 'done'
    
@app.route('/<regex(".*"):filename>/edit')
def editorRenderer(filename):
    arg = {
        'filename': filename
    }
    return render_template('index.html', arg=arg)    

# getCode
@app.route('/getCode', methods=['POST', 'GET'])
def getCode():
    if request.method == 'POST':
        path = 'code\\' +  request.get_json()['filename']
        with open(path, 'r', encoding='utf-8') as f:
            code = f.read()
        return code

# inputProcess，outputProcess函数为测试代码，后端可删除
# input process
@app.route('/input', methods=['POST', 'GET'])
def inputProcess():
    if request.method == 'POST':
        path = 'code\\' +  request.get_json()['filename']
        input_str = '\n' + request.get_json()['input']
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
        path = 'code\\' +  request.get_json()['filename']
        type_str = request.get_json()['type']
        result = {
            'value' : ''
        }
        if(path in taskmgr.keys()):
            if(type_str == 'output'):
                result['value'] = taskmgr[path].get_output()
                #if result['value'] != 0:
                #    print(result['value'])
                return json.dumps(result)
            elif(type_str == 'errmsg'):
                result['value'] = taskmgr[path].get_errmsg()
                return json.dumps(result)
    # result['value'] = -1
    # return json.dumps(result)


# 项目管理页面（首页）
@app.route('/', methods=['POST', 'GET'])
def projectmanagement():
    if request.method == 'POST':
        tmp = request.get_json()["name"]
        print(tmp)
        return 'done'
    elif request.method == 'GET':
        return render_template('projectManagement.html')

if __name__ == '__main__':
    #app.run(debug=True, host="0.0.0.0")
    app.run(debug=True, use_reloader=False)