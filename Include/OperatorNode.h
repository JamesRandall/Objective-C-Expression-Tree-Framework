//
//  OperatorNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionNode.h"

typedef enum
{
	opEquality = 1,
	opRelational = 2,
	opAdditive = 3,
	opMultiplicative = 4
} operatorPrecedenceEnum;

typedef enum
{
	asLeft,
	asRight
} operatorAssociativityEnum;
	

@interface OperatorNode : ExpressionNode {
	ExpressionNode *_left;
	ExpressionNode *_right;
	operatorPrecedenceEnum _precedence;
	operatorAssociativityEnum _associativity;
}

@property (retain) ExpressionNode* left;
@property (retain) ExpressionNode* right;
@property (readonly) operatorPrecedenceEnum precedence;
@property (readonly) operatorAssociativityEnum associativity;

@end
