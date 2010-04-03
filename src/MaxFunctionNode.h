//
//  MaxFunctionNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 03/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FunctionNode.h"

@class ExpressionNode;

@interface MaxFunctionNode : FunctionNode {
	ExpressionNode *_value1;
	ExpressionNode *_value2;
}

@property (retain) ExpressionNode* value1;
@property (retain) ExpressionNode* value2;

@end
