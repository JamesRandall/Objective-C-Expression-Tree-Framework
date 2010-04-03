//
//  ObjectArithmetic.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "ObjectArithmetic.h"


@implementation ObjectArithmetic

+ (id)addValue:(id)leftValue toValue:(id)rightValue
{
	if (![leftValue isKindOfClass:[NSNumber class]] || ![rightValue isKindOfClass:[NSNumber class]])
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Only NSNumber can be used in arithmetic currently, NSString in the future" userInfo:nil];
	
	id returnValue;
	const char* type = [leftValue objCType];
	if (*type == *@encode(int))
	{
		int left = [leftValue intValue];
		int right = [rightValue intValue];
		returnValue = [NSNumber numberWithInt:(left + right)];
	}
	else if (*type == *@encode(double))
	{
		double left = [leftValue doubleValue];
		double right = [rightValue doubleValue];
		returnValue = [NSNumber numberWithDouble:(left + right)];
	}
	else if (*type == *@encode(bool))
	{
		bool left = [leftValue boolValue];
		bool right = [rightValue boolValue];
		returnValue = [NSNumber numberWithBool:(left || right)];
	}
	else {
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Unsupported number type" userInfo:nil];
	}

	return returnValue;
}

+ (id)subtractValue:(id)value fromValue:(id)fromValue
{
	if (![value isKindOfClass:[NSNumber class]] || ![fromValue isKindOfClass:[NSNumber class]])
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Only NSNumber can be used in arithmetic currently, NSString in the future" userInfo:nil];
	
	id returnValue;
	const char* type = [fromValue objCType];
	if (*type == *@encode(int))
	{
		int left = [fromValue intValue];
		int right = [value intValue];
		returnValue = [NSNumber numberWithInt:(left - right)];
	}
	else if (*type == *@encode(double))
	{
		double left = [fromValue doubleValue];
		double right = [value doubleValue];
		returnValue = [NSNumber numberWithDouble:(left - right)];
	}
	else if (*type == *@encode(bool))
	{
		bool left = [fromValue boolValue];
		bool right = [value boolValue];
		returnValue = [NSNumber numberWithBool:(left || right)];
	}
	else {
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Unsupported number type" userInfo:nil];
	}
	
	return returnValue;
}

+ (id)multiplyValue:(id)leftValue byValue:(id)rightValue
{
	if (![leftValue isKindOfClass:[NSNumber class]] || ![rightValue isKindOfClass:[NSNumber class]])
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Only NSNumber can be used in arithmetic currently, NSString in the future" userInfo:nil];
	
	id returnValue;
	const char* type = [leftValue objCType];
	if (*type == *@encode(int))
	{
		int left = [leftValue intValue];
		int right = [rightValue intValue];
		returnValue = [NSNumber numberWithInt:(left * right)];
	}
	else if (*type == *@encode(double))
	{
		double left = [leftValue doubleValue];
		double right = [rightValue doubleValue];
		returnValue = [NSNumber numberWithDouble:(left * right)];
	}
	else if (*type == *@encode(bool))
	{
		bool left = [leftValue boolValue];
		bool right = [rightValue boolValue];
		returnValue = [NSNumber numberWithBool:(left * right)];
	}
	else {
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Unsupported number type" userInfo:nil];
	}
	
	return returnValue;
}

+ (id)divideValue:(id)leftValue byValue:(id)rightValue
{
	if (![leftValue isKindOfClass:[NSNumber class]] || ![rightValue isKindOfClass:[NSNumber class]])
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Only NSNumber can be used in arithmetic currently, NSString in the future" userInfo:nil];
	
	id returnValue;
	const char* type = [leftValue objCType];
	if (*type == *@encode(int))
	{
		int left = [leftValue intValue];
		int right = [rightValue intValue];
		returnValue = [NSNumber numberWithInt:(left / right)];
	}
	else if (*type == *@encode(double))
	{
		double left = [leftValue doubleValue];
		double right = [rightValue doubleValue];
		returnValue = [NSNumber numberWithDouble:(left / right)];
	}
	else if (*type == *@encode(bool))
	{
		bool left = [leftValue boolValue];
		bool right = [rightValue boolValue];
		returnValue = [NSNumber numberWithBool:(left / right)];
	}
	else {
		@throw [NSException exceptionWithName:@"InvalidArithmetic" reason:@"Unsupported number type" userInfo:nil];
	}
	
	return returnValue;
}

@end
