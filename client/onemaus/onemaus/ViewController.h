//
//  ViewController.h
//  onemaus
//
//  Created by Clayton Richardson on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MouseButton.h"
#import "VelocityView.h"

@interface ViewController : UIViewController {
    IBOutlet MouseButton* leftButton;
    IBOutlet MouseButton* rightButton;
    IBOutlet VelocityView* velocityView;
    int currentX;
    int currentY;
}

- (void)didGetData;

@end