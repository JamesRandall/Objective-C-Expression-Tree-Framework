//
//  ValueNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionNode.h"

@interface ValueNode : ExpressionNode {
	NSNumber* _value;
}

@property (retain) NSNumber* value;

- (id)initWithNumber:(NSNumber*)value;
- (id)evaluate:(id)context;

@end
