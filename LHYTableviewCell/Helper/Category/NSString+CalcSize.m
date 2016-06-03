//
//  NSString+CalcSize.m
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import "NSString+CalcSize.h"

@implementation NSString (CalcSize)

- (CGFloat)calcTextHeighttText:(NSString *)aText withWidth:(CGFloat)aWidth withAttributes:(NSDictionary *)aDict {
    CGSize size = [aText boundingRectWithSize:CGSizeMake(aWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:aDict context:nil].size;
    return ceil(size.height);
}

- (CGFloat)calcTextWidthText:(NSString *)aText withWidth:(CGFloat)aWidth withAttributes:(NSDictionary *)aDict {
    CGSize size = [aText boundingRectWithSize:CGSizeMake(aWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:aDict context:nil].size;
    return ceil(size.width);
}

@end
