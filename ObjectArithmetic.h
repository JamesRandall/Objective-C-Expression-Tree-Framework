//
//  ObjectArithmetic.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ObjectArithmetic : NSObject {

}

+ (id)addValue:(id)leftValue toValue:(id)rightValue;
+ (id)multiplyValue:(id)leftValue byValue:(id)rightValue;
+ (id)divideValue:(id)leftValue byValue:(id)rightValue;
+ (id)subtractValue:(id)leftValue fromValue:(id)rightValue;

@end
