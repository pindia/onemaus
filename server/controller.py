import objc, time

def clickMouse(x, y, button):
    bndl = objc.loadBundle('CoreGraphics', globals(), '/System/Library/Frameworks/ApplicationServices.framework')
    objc.loadBundleFunctions(bndl, globals(), [('CGPostMouseEvent', 'v{CGPoint=ff}III')])
    CGPostMouseEvent((x, y), 1, button, 1)
    CGPostMouseEvent((x, y), 1, button, 0)

def moveMouse(x, y):
    bndl = objc.loadBundle('CoreGraphics', globals(), '/System/Library/Frameworks/ApplicationServices.framework')
    objc.loadBundleFunctions(bndl, globals(), [('CGWarpMouseCursorPosition', 'v{CGPoint=ff}')])
    CGWarpMouseCursorPosition((x, y))
    
while True:
    time.sleep(1)
    moveMouse(100, 100)
    