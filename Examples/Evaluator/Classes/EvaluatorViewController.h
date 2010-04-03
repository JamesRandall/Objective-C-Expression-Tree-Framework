//
//  EvaluatorViewController.h
//  Evaluator
//
//  Created by James Randall on 03/04/2010.
//  Copyright James Randall 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluatorViewController : UIViewController {
	IBOutlet UITextField *_expression;
	IBOutlet UITextField *_result;
}

- (IBAction)evaluate:(id)sender;

@end

