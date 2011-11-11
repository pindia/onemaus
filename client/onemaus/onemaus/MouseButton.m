//
//  MouseButton.m
//  onemaus
//
//  Created by Clayton Richardson on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MouseButton.h"
#import "ServerCommunication.h"
@implementation MouseButton

@synthesize mouseButton;

- (void)viewDidLoad
{
    NSLog(@"loaded stuff");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"strings%d", mouseButton);
    [ServerCommunication clickWithButton:mouseButton];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touching started on %d", mouseButton);
}

@end
