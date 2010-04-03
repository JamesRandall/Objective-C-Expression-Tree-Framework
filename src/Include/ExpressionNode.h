//
//  ExpressionNode.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 01/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ExpressionNode : NSObject {

}

- (id)initWithString:(NSString*)contents;
- (id)evaluate;
- (id)returnType;

@end
