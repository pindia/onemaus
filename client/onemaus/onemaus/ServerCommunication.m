//
//  ServerCommunication.m
//  onemaus
//
//  Created by Douglas Jordan on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ServerCommunication.h"

@implementation ServerCommunication

static float currentX = 10;
static float currentY = 10;
const static NSString *serverIP = @"localhost:8080";

+ (void)clickWithButton:(int)button
{
    //NSlog(@"left click");
    NSURL *command = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/click/%d/%d/%d",serverIP,(int)currentX,(int)currentY,button]];
    NSURLRequest *request = [NSURLRequest requestWithURL:command];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

//+ (void)requestDidFinishLoading...
//connect = false
//request did fail load aca

+ (void)move:(float)dX:(float)dY
{
    currentX += dX;
    currentY += dY;
    
    NSURL *command = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/move/%d/%d",serverIP,(int)currentX,(int)currentY]];
    NSURLRequest *request = [NSURLRequest requestWithURL:command];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}


@end
