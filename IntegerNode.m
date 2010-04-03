//
//  IntegerNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "IntegerNode.h"


@implementation IntegerNode

- (id)initWithInteger:(int)value
{
	self = [super init];
	if (self)
	{
		self.value = [NSNumber numberWithInt:value];
	}
	return self;
}

- (id)initWithString:(NSString*)contents
{
	self = [super init];
	if (self)
	{
		int integer;
		NSScanner* scanner = [NSScanner scannerWithString:contents];
		[scanner scanInteger:&integer];
		self.value = [NSNumber numberWithInt:integer];
	}
	return self;
}

@end
