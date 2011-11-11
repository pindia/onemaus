//
//  ViewController.h
//  onemaus
//
//  Created by Clayton Richardson on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MouseButton.h"

@interface ViewController : UIViewController {
    IBOutlet MouseButton* leftButton;
    IBOutlet MouseButton* rightButton;
    int currentX;
    int currentY;
}

@end