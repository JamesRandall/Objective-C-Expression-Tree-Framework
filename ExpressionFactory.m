//
//  ExpressionFactory.m
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import "ExpressionFactory.h"
#import "OperatorNodeFactory.h"
#import "OpenBracketNode.h"
#import "FunctionNodeFactory.h"
#import "CloseBracketNode.h"
#import "ParameterSeperatorNode.h"
#import "ValueNode.h"
#import "DoubleNode.h"
#import "OperatorNode.h"
#import "FunctionNode.h"
#import "Stack.h"

NSString *kOpenBracket = @"(";
NSString *kCloseBracket = @")";
NSString *kParameterSeperator = @",";
NSString *kStructuralCharacters = @"(),";

@interface ExpressionFactory (Private)
- (ExpressionNode*)structuralOperatorFromString:(NSString*)string;
- (void)buildCharacterSets;
- (ExpressionNode*)tryExtractNodeFromString:(NSString*)expressionString matchedString:(NSString**)matchedString;
- (NSMutableArray*)splitExpression:(NSString*)expression;
- (NSMutableArray*)createRpnExpression:(NSMutableArray*)expressionComponents;
- (ExpressionNode*)createTreeFromRpnExpression:(NSMutableArray*)rpnExpression;
@end

@implementation ExpressionFactory (Private)

- (ExpressionNode*)structuralOperatorFromString:(NSString*)string
{
	if ([string isEqualToString:kOpenBracket])
		return [[[OpenBracketNode alloc] init] autorelease];
	else if ([string isEqualToString:kCloseBracket])
		return [[[CloseBracketNode alloc] init] autorelease];
	else if ([string isEqualToString:kParameterSeperator])
		return [[[ParameterSeperatorNode alloc] init] autorelease];
	@throw [NSException exceptionWithName:@"BadExpression" reason:@"Unrecognised structural node" userInfo:nil];
}

- (void)buildCharacterSets
{
	if (_operatorCharacterSet != nil)
		[_operatorCharacterSet release];
	NSMutableCharacterSet* structuralOperatorCharacterSet = [[NSMutableCharacterSet alloc] init];
	[structuralOperatorCharacterSet addCharactersInString:kStructuralCharacters];
	_structuralOperatorCharacterSet = structuralOperatorCharacterSet;
	_operatorCharacterSet = [[_operatorNodeFactory operatorCharacterSet] retain];
	_functionCharacterSet = [[NSCharacterSet letterCharacterSet] retain];
	
	NSMutableCharacterSet* numericCharacterSet = [[NSMutableCharacterSet alloc] init];
	[numericCharacterSet addCharactersInString:@"."];
	[numericCharacterSet formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
	_numericCharacterSet = numericCharacterSet;
}

- (ExpressionNode*)tryExtractNodeFromString:(NSString*)expressionString matchedString:(NSString**)matchedString
{
	NSString* firstCharacter = [expressionString substringToIndex:1];
	NSCharacterSet *scanningSet = nil;
	ExpressionNode *node = nil;
	
	// numeric
	if ([firstCharacter rangeOfCharacterFromSet:_numericCharacterSet].location != NSNotFound)
	{
		scanningSet = _numericCharacterSet;
	}
	// operator
	else if ([firstCharacter rangeOfCharacterFromSet:_operatorCharacterSet].location != NSNotFound)
	{
		scanningSet = _operatorCharacterSet;
	}
	// structural operators
	else if ([firstCharacter rangeOfCharacterFromSet:_structuralOperatorCharacterSet].location != NSNotFound)
	{
		*matchedString = firstCharacter;
		return [self structuralOperatorFromString:firstCharacter];
	}
	// function
	else if ([firstCharacter rangeOfCharacterFromSet:_functionCharacterSet].location != NSNotFound)
	{
		scanningSet = _functionCharacterSet;
	}
	else {
		@throw [NSException exceptionWithName:@"BadExpression" reason:@"Unrecognised character" userInfo:nil];
	}
	
	int index = 0;
	NSString* testCharacter = [expressionString substringWithRange:NSMakeRange(index, 1)];
	while(index < expressionString.length && [testCharacter rangeOfCharacterFromSet:scanningSet].location != NSNotFound)
	{
		index++;
		if (index < expressionString.length)
			testCharacter = [expressionString substringWithRange:NSMakeRange(index, 1)];
	}
	
	if (scanningSet == _functionCharacterSet && testCharacter != nil) 
	{
		if (![testCharacter isEqualToString:@"("])
		{
			@throw [NSException exceptionWithName:@"BadExpression" reason:@"Functions must be followed by a bracket" userInfo:nil];
		}
	}
		
	*matchedString = [expressionString substringToIndex:index];
	if (scanningSet == _numericCharacterSet)
	{
		node = [[[DoubleNode alloc] initWithString:*matchedString] autorelease];
	}
	else if (scanningSet == _operatorCharacterSet)
	{
		node = [_operatorNodeFactory operatorFromString:*matchedString];
		if (node == nil)
			@throw [NSException exceptionWithName:@"BadExpression" reason:@"Function not recognised" userInfo:nil];
	}
	else if (scanningSet == _functionCharacterSet)
	{
		node = [_functionNodeFactory functionFromName:*matchedString];
		if (node == nil)
			@throw [NSException exceptionWithName:@"BadExpression" reason:@"Function not recognised" userInfo:nil];
	}
	
	return node;
}

- (NSMutableArray*)splitExpression:(NSString*)expression
{
	if (_operatorCharacterSet == nil || _numericCharacterSet == nil || _functionCharacterSet == nil)
		[self buildCharacterSets];
	
	NSMutableArray* components = [[[NSMutableArray alloc] init] autorelease];
	expression = [expression stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	while (expression.length > 0)
	{
		NSString* matchedString = nil;
		ExpressionNode* node = [self tryExtractNodeFromString:expression matchedString:&matchedString];
		if (node != nil)
		{
			[components addObject:node];
		}
		if (matchedString != nil)
			expression = [expression substringFromIndex:matchedString.length];
	}
	return components;
}

// Creates a RPN expression using a shunting yard type approach
- (NSMutableArray*)createRpnExpression:(NSMutableArray*)expressionComponents
{
	Stack* operatorStack = [[Stack alloc] init];
	NSMutableArray* output = [[[NSMutableArray alloc] init] autorelease];
	
	for (ExpressionNode* node in expressionComponents)
	{
		if ([node isKindOfClass:[FunctionNode class]])
		{
			[operatorStack push:node];
		}
		else if ([node isKindOfClass:[ParameterSeperatorNode class]])
		{
			while(!([[operatorStack peek] isKindOfClass:[OpenBracketNode class]]))
			{
				[output addObject:[operatorStack pop]];
			}
		}
		else if ([node isKindOfClass:[OperatorNode class]])
		{
			OperatorNode* operatorNode = (OperatorNode*)node;
			if (operatorStack.any)
			{
				if ([[operatorStack peek] isKindOfClass:[OperatorNode class]])
				{
					OperatorNode* head = (OperatorNode*)[operatorStack peek];
					if ((operatorNode.associativity == asLeft &&
						 operatorNode.precedence <= head.precedence) ||
						(operatorNode.associativity == asRight &&
						 operatorNode.precedence < head.precedence))
					{
						[operatorStack pop];
						[output addObject:head];
					}
				}
			}
			[operatorStack push:operatorNode];
		}
		else if ([node isKindOfClass:[ValueNode class]])
		{
			[output addObject:node];
		}
		else if ([node isKindOfClass:[OpenBracketNode class]])
		{
			[operatorStack push:node];
		}
		else if ([node isKindOfClass:[CloseBracketNode class]])
		{
			if (!operatorStack.any)
				@throw [NSException exceptionWithName:@"ExpressionError" reason:@"An operator should be on the stack" userInfo:nil];
			while (![[operatorStack peek] isKindOfClass:[OpenBracketNode class]])
			{
				[output addObject:[operatorStack pop]];
			}
			[operatorStack pop];
			if (operatorStack.any && [[operatorStack peek] isKindOfClass:[FunctionNode class]])
			{
				[output addObject:[operatorStack pop]];
			}
		}
		else {
			@throw [NSException exceptionWithName:@"ExpressionError" reason:@"Unexpected node encountered in node set" userInfo:nil];
		}
	}
	
	while (operatorStack.any)
	{
		[output addObject:[operatorStack pop]];
	}
	
	[operatorStack release];
	return output;
}

- (ExpressionNode*)createTreeFromRpnExpression:(NSMutableArray*)rpnExpression
{
	Stack* outputStack = [[Stack alloc] init];
	ExpressionNode* returnNode;
	
	for(ExpressionNode* node in rpnExpression)
	{
		if ([node isKindOfClass:[OperatorNode class]])
		{
			OperatorNode* operatorNode = (OperatorNode*)node;
			operatorNode.right = [outputStack pop];
			operatorNode.left = [outputStack pop];
		}
		else if ([node isKindOfClass:[FunctionNode class]])
		{
			FunctionNode* functionNode = (FunctionNode*)node;
			int numberOfParameters = functionNode.numberOfParameters;
			ExpressionNode* parameters[numberOfParameters];
			for (int index = (numberOfParameters - 1); index >= 0; index--)
				parameters[index] = [outputStack pop];
			[functionNode applyParameters:parameters];
		}
		[outputStack push:node];
	}
	
	returnNode = [outputStack pop];
	[outputStack release];
	return returnNode;
}

@end


@implementation ExpressionFactory

- (id)init
{
	self = [super init];
	if (self)
	{
		_operatorNodeFactory = [[OperatorNodeFactory alloc] init];
		_functionNodeFactory = [[FunctionNodeFactory alloc] init];
	}
	return self;
}

- (void)dealloc
{
	[_operatorNodeFactory release];
	[_functionNodeFactory release];
	if (_operatorCharacterSet != nil)
		[_operatorCharacterSet release];
	if (_numericCharacterSet != nil)
		[_numericCharacterSet release];
	if (_functionCharacterSet != nil)
		[_functionCharacterSet release];
	if (_structuralOperatorCharacterSet != nil)
		[_structuralOperatorCharacterSet release];

	[super dealloc];
}

- (ExpressionNode*)expressionFromString:(NSString*)expressionString
{
	NSMutableArray* components = [self splitExpression:expressionString];
	NSMutableArray* rpnOrderedComponents = [self createRpnExpression:components];
	ExpressionNode* tree = [self createTreeFromRpnExpression:rpnOrderedComponents];
	
	return tree;
}

- (void)registerFunctionWithName:(NSString*)name type:(Class)type
{
	[_functionNodeFactory registerFunctionNode:name type:type];
}

@end
