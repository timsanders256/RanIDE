from flask import Flask, render_template, request, redirect, url_for, session, json
import time, random
app = Flask(__name__)
app.secret_key = 'komejikoishi'

@app.route('/') # homepage
def homepage():
    return render_template('index.html')

if __name__ == '__main__':
    #app.run(debug=True, host="0.0.0.0")
    app.run(debug=True)