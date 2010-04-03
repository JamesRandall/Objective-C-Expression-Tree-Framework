//
//  Stack.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (id)init
{
	self = [super init];
	if (self)
	{
		_contents = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc
{
	[_contents release];
	[super dealloc];
}

- (void)push:(id)object
{
	[_contents addObject:object];
}

- (id)pop
{
	id object = [[[_contents lastObject] retain] autorelease];
	[_contents removeLastObject];
	return object;
}

- (id)peek
{
	return [_contents lastObject];
}

- (bool)any
{
	return _contents.count > 0;
}

- (int)count
{
	return _contents.count;
}

@end
