//
//  FactorialFunctionNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 05/04/2010.
//  Copyright 2010 Accidental Fish. All rights reserved.
//

#import "FactorialFunctionNode.h"


@implementation FactorialFunctionNode

@synthesize value=_value;

- (int)numberOfParameters
{
	return 1;
}

- (void)applyParameters:(ExpressionNode*[])parameters
{
	self.value = parameters[0];
}

- (void)dealloc
{
	self.value = nil;
	[super dealloc];
}

- (id)evaluate:(id)context
{
	NSNumber* value = [self.value evaluate:context];
	int limit = [value intValue];
	if (limit == 0)
		return [NSNumber numberWithDouble:0.0];
	double result = 1.0;
	for (int factorial = 2; factorial <= limit; factorial++)
		result *= factorial;
	return [NSNumber numberWithDouble:result];
}

@end
