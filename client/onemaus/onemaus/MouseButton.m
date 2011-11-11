//
//  MouseButton.m
//  onemaus
//
//  Created by Clayton Richardson on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MouseButton.h"

@implementation MouseButton

@synthesize mouseButton;



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"strings%d", mouseButton);
}

@end
