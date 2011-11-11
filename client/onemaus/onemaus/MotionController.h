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
    NSTimer* timer;
    NSTimer* sendTimer;

    
    
}
@end
