//
//  FunctionNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionNode.h"

@interface FunctionNode : ExpressionNode {

}

@property (readonly) int numberOfParameters;

- (void)applyParameters:(ExpressionNode*[])parameters;

@end
