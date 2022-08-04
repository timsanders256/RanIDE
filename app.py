from flask import Flask, jsonify, render_template, request, redirect, url_for, session, json
import time, random
import buffer
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

@app.route('/') # homepage
def homepage():
    return render_template('index.html')

@app.route('/runCode', methods=['GET', 'POST'])
def runCode():
    res = jsonify({})
    res.headers['Access-Control-Allow-Origin'] = '*'
    if request.method == 'POST':
        # 测试代码（后端可根据自己需要更改），读取前端发送的代码
        mycode = request.get_json()['code']
        # mycode格式为str
        print(type(mycode))
        print(mycode)     
    return res

# upstream: from user to server
# the frontend send 'GET' to this address
# for the execution output from file 'filename' 
@app.route('/<regex(".*"):filename>/upstream', methods=['POST', 'GET'])
def example(filename):
    if request.method == 'GET':
        return "filename: %s" % (filename)

# downstream: from server to user
# keyboard input from browser
@app.route('/<regex(".*"):filename>/downstream', methods=['POST', 'GET'])
def example2(filename):
    if request.method == 'POST':
        pass


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")