//
//  EvaluatorAppDelegate.h
//  Evaluator
//
//  Created by James Randall on 03/04/2010.
//  Copyright James Randall 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EvaluatorViewController;

@interface EvaluatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EvaluatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EvaluatorViewController *viewController;

@end

