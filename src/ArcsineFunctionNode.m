//
//  ArcsineFunctionNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 05/04/2010.
//  Copyright 2010 Accidental Fish. All rights reserved.
//

#import "ArcsineFunctionNode.h"


@implementation ArcsineFunctionNode

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
	return [NSNumber numberWithDouble:asin([value doubleValue])];
}

@end
