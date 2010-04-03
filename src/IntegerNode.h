//
//  IntegerNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValueNode.h"

@interface IntegerNode : ValueNode {

}

- (id)initWithInteger:(int)value;

@end
