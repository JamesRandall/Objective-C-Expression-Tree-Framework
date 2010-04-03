//
//  OperatorNodePair.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "OperatorNodePair.h"

@implementation OperatorNodePair

@synthesize stringRepresentation = _stringRepresentation;
@synthesize type = _type;

- (id)initWithStringRepresentation:(NSString*)stringRepresentation type:(Class)type
{
	self = [super init];
	if (self)
	{
		self.stringRepresentation = stringRepresentation;
		self.type = type;
	}
	return self;
}

+ (OperatorNodePair*)withNodeString:(NSString*)stringRepresentation type:(Class)type
{
	return [[[OperatorNodePair alloc] initWithStringRepresentation:stringRepresentation type:type] autorelease];
}

- (void)dealloc
{
	self.stringRepresentation = nil;
	[super dealloc];
}

@end
