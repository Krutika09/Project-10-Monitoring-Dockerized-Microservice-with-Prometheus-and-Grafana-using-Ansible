from flask import Flask
from prometheus_client import Counter, generate_latest

app = Flask(__name__)
counter = Counter('hits', 'App Hits')

@app.route('/')
def home():
    counter.inc()
    return "Hello from microservice!"

@app.route('/metrics')
def metrics():
    return generate_latest(counter)
