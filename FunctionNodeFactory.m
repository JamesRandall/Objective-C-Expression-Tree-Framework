//
//  FunctionNodeFactory.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "FunctionNodeFactory.h"
#import "MinFunctionNode.h"
#import "MaxFunctionNode.h"

@implementation FunctionNodeFactory

- (id)init
{
	self = [super init];
	if (self)
	{
		_functions = [[NSMutableDictionary alloc] init];
		[self registerFunctionNode:@"min" type:[MinFunctionNode class]];
		[self registerFunctionNode:@"max" type:[MaxFunctionNode class]];
	}
	return self;
}

- (void)dealloc
{
	[_functions release];
	[super dealloc];
}

- (void)registerFunctionNode:(NSString*)name type:(Class)type
{
	[_functions setObject:type forKey:[name lowercaseString]];
}

- (FunctionNode*)functionFromName:(NSString*)functionName
{
	Class type = [_functions objectForKey:[functionName lowercaseString]];
	return [[[type alloc] init] autorelease];
}

@end
