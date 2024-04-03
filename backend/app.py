from flask import Flask 

# create flask app 
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, World!"