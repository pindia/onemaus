//
//  ServerCommunication.h
//  onemaus
//
//  Created by Douglas Jordan on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCommunication : NSObject

+ (void)clickWithButton:(int)button;
+ (void)move:(float)dX:(float)dY;
+ (void)connect;

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

@end
