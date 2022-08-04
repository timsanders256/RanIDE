from flask import Flask, render_template, request, redirect, url_for, session, json
import time, random
app = Flask(__name__)
app.secret_key = 'komejikoishi'  #古明地恋

@app.route('/',methods = ['GET','POST']) # homepage
def homepage():
    if request.method == 'GET':
        return render_template('index.html')
    else :
        print('post成功')

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0")