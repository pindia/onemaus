//
//  MotionManager.m
//  onemaus
//
//  Created by Douglas Jordan on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MotionController.h"
#import "ServerCommunication.h"
#define SCALE_FACTOR 10000
@implementation MotionController

static float velocityX = 0;
static float velocityY = 0;
static float frequency = 50.0;

- (id)init{
	self = [super init];
	motionManager = [[CMMotionManager alloc] init]; 
	motionManager.accelerometerUpdateInterval = 1.0/frequency;
    motionManager.deviceMotionUpdateInterval = 1.0/frequency;
    
    [motionManager startDeviceMotionUpdates];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/frequency target:self selector:@selector(getData:) userInfo:nil repeats:YES];

    
	return self;
}

- (void)getData:(NSTimer*)theTimer
{
    CMDeviceMotion* deviceMotion = [motionManager deviceMotion];
	CMAcceleration acceleration = deviceMotion.userAcceleration;
    
    velocityX += (1.0/frequency) * acceleration.x;
    velocityY += (1.0/frequency) * acceleration.y;
    
    float dx = velocityX / frequency *  SCALE_FACTOR;
    float dy = velocityY / frequency *  SCALE_FACTOR;
    
    [ServerCommunication move:dx :dy];
}

@end
