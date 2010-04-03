//
//  OperatorNodeFactory.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "OperatorNodeFactory.h"
#import "OperatorNodePair.h"
#import "AdditionOperatorNode.h"
#import "MultiplicationOperatorNode.h"
#import "DivisionOperatorNode.h"
#import "SubtractionOperatorNode.h"
#import "OpenBracketNode.h"
#import "CloseBracketNode.h"
#import "ParameterSeperatorNode.h"

@implementation OperatorNodeFactory

- (id)init
{
	self = [super init];
	if (self)
	{
		_operators = [[NSMutableDictionary alloc] init];
		[self registerOperatorNode:@"+" type:[AdditionOperatorNode class]];
		[self registerOperatorNode:@"*" type:[MultiplicationOperatorNode class]];
		[self registerOperatorNode:@"/" type:[DivisionOperatorNode class]];
		[self registerOperatorNode:@"-" type:[SubtractionOperatorNode class]];
	}
	return self;
}

- (void)dealloc
{
	[_operators release];
	[super dealloc];
}

- (void)registerOperatorNode:(NSString*)nodeString type:(Class)type
{
	[_operators setObject:type forKey:nodeString];
}

- (NSCharacterSet*)operatorCharacterSet
{
	NSMutableCharacterSet* characterSet = [[[NSMutableCharacterSet alloc] init] autorelease];
	for(NSString* operatorKey in _operators)
	{
		[characterSet addCharactersInString:operatorKey];
	}
	return characterSet;
}

- (OperatorNode*)operatorFromString:(NSString*)operatorString
{
	Class type = [_operators objectForKey:operatorString];
	return [[[type alloc] init] autorelease];
}


@end
