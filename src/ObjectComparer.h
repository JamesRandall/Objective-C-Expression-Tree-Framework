//
//  ObjectComparer.h
//  ExpressionTreeFramework
//
//  Created by James Randall on 02/04/2010.
//  Copyright 2010 James Randall. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ObjectComparer : NSObject {

}

+ (NSComparisonResult)compareValue:(id)valueOne withValue:(id)valueTwo;

@end
