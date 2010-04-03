//
//  OperatorNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "OperatorNode.h"


@implementation OperatorNode

@synthesize left = _left;
@synthesize right = _right;

- (void)dealloc
{
	self.left = nil;
	self.right = nil;
	[super dealloc];
}

- (operatorPrecedenceEnum)precedence
{
	return opEquality;
}

- (operatorAssociativityEnum)associativity
{
	return asLeft;
}

@end
