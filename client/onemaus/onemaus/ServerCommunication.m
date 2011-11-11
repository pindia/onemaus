//
//  ServerCommunication.m
//  onemaus
//
//  Created by Douglas Jordan on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ServerCommunication.h"

@implementation ServerCommunication

static float currentX = 100;
static float currentY = 100;
static bool connected = false;
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

+ (void)connect
{    
    NSURL *command = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/resolution",serverIP]];
    NSURLRequest *request = [NSURLRequest requestWithURL:command];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"Failed to load connection");
    connected = false;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Did finish loading %@", [connection description]);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Did receive response %@", [response description]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"did receive data %@", [data description]);
}
       
@end
