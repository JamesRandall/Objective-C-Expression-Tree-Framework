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
#import "SquareFunctionNode.h"
#import "SquareRootFunctionNode.h"
#import "PowerFunctionNode.h"
#import "FactorialFunctionNode.h"
#import "SineFunctionNode.h"
#import "CosineFunctionNode.h"
#import "TangentFunctionNode.h"
#import "ArcsineFunctionNode.h"
#import "ArccosineFunctionNode.h"
#import "ArctangentFunctionNode.h"

@implementation FunctionNodeFactory

- (id)init
{
	self = [super init];
	if (self)
	{
		_functions = [[NSMutableDictionary alloc] init];
		[self registerFunctionNode:@"min" type:[MinFunctionNode class]];
		[self registerFunctionNode:@"max" type:[MaxFunctionNode class]];
		[self registerFunctionNode:@"sqr" type:[SquareFunctionNode class]];
		[self registerFunctionNode:@"sqrt" type:[SquareRootFunctionNode class]];
		[self registerFunctionNode:@"pow" type:[PowerFunctionNode class]];
		[self registerFunctionNode:@"factorial" type:[FactorialFunctionNode class]];
		[self registerFunctionNode:@"sin" type:[SineFunctionNode class]];
		[self registerFunctionNode:@"cos" type:[CosineFunctionNode class]];
		[self registerFunctionNode:@"tan" type:[TangentFunctionNode class]];
		[self registerFunctionNode:@"arctan" type:[ArctangentFunctionNode class]];
		[self registerFunctionNode:@"arccos" type:[ArccosineFunctionNode class]];
		[self registerFunctionNode:@"arcsin" type:[ArcsineFunctionNode class]];
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
