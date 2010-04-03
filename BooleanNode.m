//
//  BooleanNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "BooleanNode.h"


@implementation BooleanNode

- (id)initWithBoolean:(bool)value
{
	self = [super init];
	if (self)
	{
		self.value = [NSNumber numberWithBool:value];
	}
	return self;
}

- (id)initWithString:(NSString*)contents
{
	self = [super init];
	if (self)
	{
		bool boolValue = NO;
		if ([contents compare:@"true" options:NSCaseInsensitiveSearch] == NSOrderedSame ||
			[contents compare:@"1" options:NSCaseInsensitiveSearch] == NSOrderedSame)
			boolValue = YES;
			
		self.value = [NSNumber numberWithBool:boolValue];
	}
	return self;
}

@end
