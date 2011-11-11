import objc, time, tempfile, os
from AppKit import NSScreen

def clickMouse(x, y, button):
    bndl = objc.loadBundle('CoreGraphics', globals(), '/System/Library/Frameworks/ApplicationServices.framework')
    objc.loadBundleFunctions(bndl, globals(), [('CGPostMouseEvent', 'v{CGPoint=ff}III')])
    CGPostMouseEvent((x, y), 1, button, 1)
    CGPostMouseEvent((x, y), 1, button, 0)

def moveMouse(x, y):
    bndl = objc.loadBundle('CoreGraphics', globals(), '/System/Library/Frameworks/ApplicationServices.framework')
    objc.loadBundleFunctions(bndl, globals(), [('CGWarpMouseCursorPosition', 'v{CGPoint=ff}')])
    CGWarpMouseCursorPosition((x, y))
    
def screenResolution():
    s = NSScreen.mainScreen().frame()
    return {'width': s.size.width, 'height':s.size.height}

def captureScreen():
    f, path = tempfile.mkstemp()
    os.system('screencapture %s' % path)
    f = open(path, 'rb')
    data = f.read()
    f.close()
    os.unlink(path)
    return data
    