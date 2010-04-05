//
//  AdditionOperatorNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "AdditionOperatorNode.h"
#import "ObjectArithmetic.h"

@implementation AdditionOperatorNode

- (id)evaluate:(id)context
{
	id leftValue = [self.left evaluate:context];
	id rightValue = [self.right evaluate:context];

	return [ObjectArithmetic addValue:leftValue toValue:rightValue];
}

- (operatorPrecedenceEnum)precedence
{
	return opAdditive;
}

- (operatorAssociativityEnum)associativity
{
	return asLeft;
}

@end
