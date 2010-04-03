//
//  OperatorNodePair.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OperatorNodePair : NSObject {
	NSString* _stringRepresentation;
	Class _type;
}

- (id)initWithStringRepresentation:(NSString*)stringRepresentation type:(Class)type;
+ (OperatorNodePair*)withNodeString:(NSString*)stringRepresentation type:(Class)type;

@property (retain) NSString* stringRepresentation;
@property (assign) Class type;

@end
