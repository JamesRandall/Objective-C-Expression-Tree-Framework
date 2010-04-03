//
//  OperatorNodeFactory.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OperatorNode;

@interface OperatorNodeFactory : NSObject {
	NSMutableDictionary *_operators;
}

- (void)registerOperatorNode:(NSString*)nodeString type:(Class)type;
- (NSCharacterSet*)operatorCharacterSet;
- (OperatorNode*)operatorFromString:(NSString*)operatorString;

@end
