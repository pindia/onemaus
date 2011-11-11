import time, json
import web

import controller

urls = (
    '/move/([0-9]+)/([0-9]+)', 'move',
    '/click/([0-9]+)/([0-9]+)/([0-9])', 'click',
    '/resolution', 'resolution',
    '/screen', 'screen'
)

app = web.application(urls, globals())

class move:        
    def GET(self, x, y):
        controller.move_mouse(int(x), int(y)) 
          
class click:        
    def GET(self, x, y, button):
        controller.click_mouse(int(x), int(y), int(button)) 
        
class resolution:        
    def GET(self):
        return json.dumps(controller.screen_resolution())
class screen:        
    def GET(self):
        web.header('Content-Type', 'image/png')
        return controller.capture_screen()

if __name__ == "__main__":
    app.run()
