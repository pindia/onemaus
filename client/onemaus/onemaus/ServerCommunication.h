//
//  ServerCommunication.h
//  onemaus
//
//  Created by Douglas Jordan on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerCommunication : NSObject

+ (void)leftClick:(int)xPos:(int)yPos;
+ (void)rightClick:(int)xPos:(int)yPos;
+ (void)move:(int)xPos:(int)yPos:(int)buttonId;
@end
