//
//  MotionManager.h
//  onemaus
//
//  Created by Douglas Jordan on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface MotionController : NSObject{

    CMMotionManager *motionManager;
    ViewController* parentController;
    NSTimer* timer;
    NSTimer* sendTimer;

    
    
}


+(float)velocityX;
+(float)velocityY;

@property (readwrite, retain) ViewController* parentController;

@end
