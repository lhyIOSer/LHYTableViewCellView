//
//  NSString+CalcSize.h
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CalcSize)

- (CGFloat)calcTextHeighttText:(NSString *)aText withWidth:(CGFloat)aWidth withAttributes:(NSDictionary *)aDict;

- (CGFloat)calcTextWidthText:(NSString *)aText withWidth:(CGFloat)aWidth withAttributes:(NSDictionary *)aDict;

@end
