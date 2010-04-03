//
//  FunctionNodeFactory.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FunctionNode;

@interface FunctionNodeFactory : NSObject {
	NSMutableDictionary *_functions;
}

- (void)registerFunctionNode:(NSString*)name type:(Class)type;
- (FunctionNode*)functionFromName:(NSString*)functionName;

@end
