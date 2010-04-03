//
//  EqualityOperatorNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EqualityOperatorNode.h"
#import "ObjectComparer.h"

@implementation EqualityOperatorNode

- (id)evaluate
{
	return [NSNumber numberWithBool:[ObjectComparer compareValue:self.left withValue:self.right]==NSOrderedSame];
}

@end
