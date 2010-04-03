//
//  ExpressionFactory.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ValueNodeFactory;
@class OperatorNodeFactory;
@class FunctionNodeFactory;
@class ExpressionNode;

@interface ExpressionFactory : NSObject {
	OperatorNodeFactory* _operatorNodeFactory;
	FunctionNodeFactory* _functionNodeFactory;
	NSCharacterSet* _operatorCharacterSet;
	NSCharacterSet* _functionCharacterSet;
	NSCharacterSet* _numericCharacterSet;
	NSCharacterSet* _structuralOperatorCharacterSet;
}

- (id)init;
- (ExpressionNode*)expressionFromString:(NSString*)expressionString;
- (void)registerFunctionWithName:(NSString*)name type:(Class)type;

@end
