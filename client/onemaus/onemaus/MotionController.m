//
//  MotionManager.m
//  onemaus
//
//  Created by Douglas Jordan on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MotionController.h"
#import "ServerCommunication.h"
#define SCALE_FACTOR 5000
@implementation MotionController

@synthesize parentController;

static int zeroes = 0;
static float velocityX = 0;
static float velocityY = 0;
static float frequency = 1000.0;
static float sendFrequency = 20.0;

+(float)velocityX{
    return velocityX;   
}

+(float)velocityY{
    return velocityY;
}

- (id)init{
	self = [super init];
	motionManager = [[CMMotionManager alloc] init]; 
	motionManager.accelerometerUpdateInterval = 1.0/frequency;
    motionManager.deviceMotionUpdateInterval = 1.0/frequency;
    

    
    [motionManager startDeviceMotionUpdates];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/frequency target:self selector:@selector(getData:) userInfo:nil repeats:YES];
    sendTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/sendFrequency target:self selector:@selector(sendData:) userInfo:nil repeats:YES];

    
	return self;
}

- (void)getData:(NSTimer*)theTimer
{
    CMDeviceMotion* deviceMotion = [motionManager deviceMotion];
	CMAcceleration acceleration = deviceMotion.userAcceleration;
    
    //velocityX = 0;
    //velocityY = 0;
    
    //NSLog(@"%.6f, %.6f", acceleration.x, acceleration.y);
    
    float ax = acceleration.x;
    float ay = acceleration.y;
    if(abs(ax) < 0.00001)
        ax = 0;
    if(abs(ay) < 0.00001)
        ay = 0;

    
    velocityX += (1.0/frequency) * ax;
    velocityY += (1.0/frequency) * ay;
    
    if(ax == 0 && ay == 0){
        zeroes++;
        if(zeroes > 5){
            velocityX = 0;
            velocityY = 0;
        }
    } else{
        zeroes = 0;
    }
    
    
    [parentController didGetData];
    

}

- (void)sendData:(NSTimer*)theTimer
{
    float dx = velocityX / sendFrequency *  SCALE_FACTOR;
    float dy = velocityY / sendFrequency *  SCALE_FACTOR;
    
    //NSLog(@"%.2f, %.2f", dx, dy);
    
    [ServerCommunication move:dx :dy];
    
}

@end
