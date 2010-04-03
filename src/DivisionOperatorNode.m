//
//  DivisionOperatorNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 03/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "DivisionOperatorNode.h"
#import "ObjectArithmetic.h"

@implementation DivisionOperatorNode

- (id)evaluate
{
	id leftValue = [self.left evaluate];
	id rightValue = [self.right evaluate];
	
	return [ObjectArithmetic divideValue:leftValue byValue:rightValue];
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
