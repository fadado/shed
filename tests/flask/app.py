# vim:fileencoding=utf-8:et:ts=4:sw=4

from flask import Flask
from redis import Redis

application = Flask(__name__)
session = Redis(host="redis", port=6379)

@application.route('/')
def hello():
    session.incr('visits')
    return 'Hello!\nVisited %s times!\n' % (session.get('visits'),)

if __name__ == '__main__':
     application.run(host="0.0.0.0", debug=True)
