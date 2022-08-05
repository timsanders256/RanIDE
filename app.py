from flask import Flask, jsonify, render_template, request, redirect, url_for, session, json
import time, random
import buffer
import logging
import localprocess
from werkzeug.routing import BaseConverter
class RegexConverter(BaseConverter):
    def __init__(self, url_map, *items):
        super(RegexConverter, self).__init__(url_map)
        self.regex = items[0]

app = Flask(__name__)
taskmgr = {}
app.secret_key = 'komejikoishi'
app.url_map.converters['regex'] = RegexConverter
import buffer

@app.route('/file1', methods=['GET', 'POST']) # 文件编辑页面
def homepage():
    return 'This is the homepage.'

@app.route('/runCode', methods=['GET', 'POST'])
def runCode():
    global taskmgr
    if request.method == 'POST':
        path = request.get_json()['filename']
        type = request.get_json()['type']
        if(path in taskmgr.keys()):
            # lazy-doing
            if(taskmgr[path].state_running() == False):
                taskmgr[path] = localprocess.process(path, type)
                return 'done'
            else:
                return 'wait'
        taskmgr[path] = localprocess.process(path, type)
        return 'done'

@app.route('/saveCode', methods=['GET', 'POST'])
def saveCode():
    if request.method == 'POST':
        path = request.get_json()['filename']
        mycode = request.get_json()['code']
        with open(path, 'w') as f:
            mycode = mycode.split('\n')
            f.writelines(mycode)
            pass
        return 'done'

# upstream: from server to user
# the frontend send 'GET' to this address
# for the execution output from file 'filename' 
@app.route('/<regex(".*"):filename>/edit')
def editorRenderer(filename):
    return render_template('index.html', filename=filename)

# upstream: from server to user
# the frontend send 'GET' to this address
# for the execution output from file 'filename' 
@app.route('/<regex(".*"):filename>/upstream', methods=['POST', 'GET'])
def example(filename):
    if request.method == 'GET':
        return "filename: %s" % (filename)

# downstream: from user to server
# keyboard input from browser
@app.route('/<regex(".*"):filename>/downstream', methods=['POST', 'GET'])
def example2(filename):
    if request.method == 'POST':
        pass


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
    app.run(debug=True)