//
//  PowerFunctionNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 05/04/2010.
//  Copyright 2010 Accidental Fish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FunctionNode.h"

@interface PowerFunctionNode : FunctionNode {
	ExpressionNode *_value;
	ExpressionNode *_power;
}

@property (retain) ExpressionNode* value;
@property (retain) ExpressionNode* power;

@end
