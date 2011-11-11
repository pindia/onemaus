import time
import BaseHTTPServer

from controller import moveMouse, clickMouse

HOST_NAME = '0.0.0.0' # !!!REMEMBER TO CHANGE THIS!!!
PORT_NUMBER = 8080 # Maybe set this to 9000.


class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):
    def do_GET(s):
        args = s.path.split('/')[1:]
        if len(args) < 3:
            s.send_response(404)
            return
        if args[0] == 'move':
            x = int(args[1])
            y = int(args[2])
            moveMouse(x, y)
        if args[0] == 'click':
            x = int(args[1])
            y = int(args[2])
            button = int(args[3])
            clickMouse(x, y, button)
            
        """Respond to a GET request."""
        s.send_response(200)
        s.send_header("Content-type", "text/html")
        s.end_headers()
        s.wfile.write("<html><head><title>Title goes here.</title></head>")
        s.wfile.write(args)

if __name__ == '__main__':
    server_class = BaseHTTPServer.HTTPServer
    httpd = server_class((HOST_NAME, PORT_NUMBER), MyHandler)
    print time.asctime(), "Server Starts - %s:%s" % (HOST_NAME, PORT_NUMBER)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    print time.asctime(), "Server Stops - %s:%s" % (HOST_NAME, PORT_NUMBER)