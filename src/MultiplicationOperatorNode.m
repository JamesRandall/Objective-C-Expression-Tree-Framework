//
//  MultiplicationOperatorNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 03/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "MultiplicationOperatorNode.h"
#import "ObjectArithmetic.h"

@implementation MultiplicationOperatorNode

- (id)evaluate:(id)context
{
	id leftValue = [self.left evaluate:context];
	id rightValue = [self.right evaluate:context];
	
	return [ObjectArithmetic multiplyValue:leftValue byValue:rightValue];
}

- (operatorPrecedenceEnum)precedence
{
	return opMultiplicative;
}

- (operatorAssociativityEnum)associativity
{
	return asLeft;
}

@end
