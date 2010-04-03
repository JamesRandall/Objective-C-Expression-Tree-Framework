//
//  SubtractionOperatorNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 03/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "SubtractionOperatorNode.h"
#import "ObjectArithmetic.h"

@implementation SubtractionOperatorNode

- (id)evaluate
{
	id leftValue = [self.left evaluate];
	id rightValue = [self.right evaluate];
	
	return [ObjectArithmetic subtractValue:rightValue fromValue:leftValue];
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
