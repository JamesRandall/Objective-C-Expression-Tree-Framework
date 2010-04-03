//
//  DoubleNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "DoubleNode.h"


@implementation DoubleNode

- (id)initWithDouble:(double)value
{
	self = [super init];
	if (self)
	{
		self.value = [NSNumber numberWithDouble:value];
	}
	return self;
}

- (id)initWithString:(NSString*)contents
{
	self = [super init];
	if (self)
	{
		double doubleValue;
		NSScanner* scanner = [NSScanner scannerWithString:contents];
		[scanner scanDouble:&doubleValue];
		self.value = [NSNumber numberWithDouble:doubleValue];
	}
	return self;
}

@end
