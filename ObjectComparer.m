//
//  ObjectComparer.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "ObjectComparer.h"


@implementation ObjectComparer

+ (NSComparisonResult)compareValue:(id)valueOne withValue:(id)valueTwo
{
	if (![valueOne isKindOfClass:[NSNumber class]] || ![valueTwo isKindOfClass:[NSNumber class]])
		@throw [NSException exceptionWithName:@"InvalidTypeComparison" reason:@"Only NSNumber can be compared currently, NSString in the future" userInfo:nil];
	return [valueOne compare:valueTwo];
}

@end
