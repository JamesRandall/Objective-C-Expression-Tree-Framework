//
//  PowerFunctionNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 05/04/2010.
//  Copyright 2010 Accidental Fish. All rights reserved.
//

#import "PowerFunctionNode.h"

@implementation PowerFunctionNode

@synthesize value = _value;
@synthesize power = _power;

- (int)numberOfParameters
{
	return 2;
}

- (void)applyParameters:(ExpressionNode*[])parameters
{
	self.value = parameters[0];
	self.power = parameters[1];
}

- (void)dealloc
{
	self.value = nil;
	self.power = nil;
	[super dealloc];
}

- (id)evaluate:(id)context
{
	NSNumber* value = [self.value evaluate:context];
	NSNumber* power = [self.power evaluate:context];
	return [NSNumber numberWithDouble:pow([value doubleValue], [power doubleValue])];
}

@end
