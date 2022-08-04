from flask import Flask, jsonify, render_template, request, redirect, url_for, session, json
import time, random
app = Flask(__name__)
app.secret_key = 'komejikoishi'

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

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")