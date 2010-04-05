//
//  ExpressionNode.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "ExpressionNode.h"

@implementation ExpressionNode

- (id)initWithString:(NSString*)contents
{
	return [super init];
}

- (id)evaluate:(id)context
{
	@throw [NSException exceptionWithName:@"ExecutionError" reason:@"Probable incorrect override of evaluate in derived node" userInfo:nil];
}

- (id)returnType
{
	return nil;
}

@end
