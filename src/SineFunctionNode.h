//
//  SineFunctionNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 05/04/2010.
//  Copyright 2010 Accidental Fish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FunctionNode.h"

@interface SineFunctionNode : FunctionNode {
	ExpressionNode *_value;
}

@property (retain) ExpressionNode* value;

@end
