import objc, time, tempfile, os
from AppKit import NSScreen, NSPasteboard, NSArray, NSString

def click_mouse(x, y, button):
    bndl = objc.loadBundle('CoreGraphics', globals(), '/System/Library/Frameworks/ApplicationServices.framework')
    objc.loadBundleFunctions(bndl, globals(), [('CGPostMouseEvent', 'v{CGPoint=ff}III')])
    CGPostMouseEvent((x, y), 1, button, 1)
    CGPostMouseEvent((x, y), 1, button, 0)

def move_mouse(x, y):
    bndl = objc.loadBundle('CoreGraphics', globals(), '/System/Library/Frameworks/ApplicationServices.framework')
    objc.loadBundleFunctions(bndl, globals(), [('CGWarpMouseCursorPosition', 'v{CGPoint=ff}')])
    CGWarpMouseCursorPosition((x, y))
    
def screen_resolution():
    s = NSScreen.mainScreen().frame()
    return {'width': s.size.width, 'height':s.size.height}
'''
def capture_screen():
    os.system('screencapture -x -c')'''


def capture_screen():
    f, path = tempfile.mkstemp()
    os.system('screencapture -x %s' % path)
    f = open(path, 'rb')
    data = f.read()
    f.close()
    os.unlink(path)
    return data

if __name__ == '__main__':
    capture_screen()    