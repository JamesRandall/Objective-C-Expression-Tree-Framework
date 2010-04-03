//
//  EvaluatorViewController.m
//  Evaluator
//
//  Created by James Randall on 03/04/2010.
//  Copyright James Randall 2010. All rights reserved.
//

#import "EvaluatorViewController.h"
#import "ExpressionTreeFramework.h"

@implementation EvaluatorViewController

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction)evaluate:(id)sender
{
	ExpressionFactory* factory = [[ExpressionFactory alloc] init];

	ExpressionNode* node = [factory expressionFromString:_expression.text];
	NSNumber *result = [node evaluate];
	_result.text = [result stringValue];

	[factory release];
}

- (void)dealloc {
    [super dealloc];
}

@end
