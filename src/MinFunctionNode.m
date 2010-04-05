//
//  MinFunctionNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 03/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "MinFunctionNode.h"


@implementation MinFunctionNode

@synthesize value1 = _value1;
@synthesize value2 = _value2;

- (int)numberOfParameters
{
	return 2;
}

- (void)applyParameters:(ExpressionNode*[])parameters
{
	self.value1 = parameters[0];
	self.value2 = parameters[1];
}

- (void)dealloc
{
	self.value1 = nil;
	self.value2 = nil;
	[super dealloc];
}

- (id)evaluate:(id)context
{
	NSNumber* value1 = [self.value1 evaluate:context];
	NSNumber* value2 = [self.value2 evaluate:context];
	
	NSComparisonResult comparison = [value1 compare:value2];
	if (comparison == NSOrderedAscending || comparison == NSOrderedSame)
	{
		return value1;
	}
	return value2;
}

@end
