//
//  ValueNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "ValueNode.h"


@implementation ValueNode

@synthesize value = _value;

- (id)initWithNumber:(NSNumber*)value
{
	self = [super init];
	if (self)
	{
		self.value = value;
	}
	return self;
}

- (id)evaluate:(id)context
{
	return self.value;
}

- (void)dealloc
{
	self.value = nil;
	[super dealloc];
}

@end
