//
//  Stack.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Stack : NSObject {
	NSMutableArray* _contents;
}

- (id)init;
- (void)push:(id)object;
- (id)pop;
- (id)peek;

@property (readonly) bool any;
@property (readonly) int count;

@end
