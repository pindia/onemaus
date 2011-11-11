//
//  VelocityView.m
//  onemaus
//
//  Created by Pindi Albert on 11/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VelocityView.h"
#import "MotionController.h"

@implementation VelocityView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    int centerX = self.frame.size.width / 2;
    int centerY = self.frame.size.height / 2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    
    // Draw a line
    //Start at this point
    CGContextMoveToPoint(context, centerX, centerY);
    
    //NSLog(@"%.2f, %.2f", MotionController.velocityX, MotionController.velocityY);
    
    //Give instructions to the CGContext
    //(move "pen" around the screen)
    CGContextAddLineToPoint(context, centerX + MotionController.velocityX*1000, centerY + MotionController.velocityY*1000);
    
    
    //Draw it
    CGContextStrokePath(context);
    

    
    
}


@end
