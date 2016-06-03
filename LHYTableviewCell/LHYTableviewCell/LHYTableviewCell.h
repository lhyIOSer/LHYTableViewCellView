//
//  LHYTableviewCell.h
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYTableViewCellView.h"

@interface LHYTableviewCell : UITableViewCell

@property (nonatomic, assign) LHYTableViewCellViewType cellType;

///左图标
@property (nonatomic, strong) UIImage *leftImg;

///右图标
@property (nonatomic, strong) UIImage *rightImg;

///标题文字
@property (nonatomic, copy) NSString *title;

///提示文字
@property (nonatomic, copy) NSString *tips;

///查看更多文字
@property (nonatomic, copy) NSString *more;

///标题文字颜色
@property (nonatomic, strong) UIColor *titleColor;

///提示文字颜色
@property (nonatomic, strong) UIColor *tipsColor;

///查看更多文字颜色
@property (nonatomic, strong) UIColor *moreColor;

///标题文字大小
@property (nonatomic, strong) UIFont   *titleFont;

///提示文字大小
@property (nonatomic, strong) UIFont   *tipsFont;

///查看更多文字大小
@property (nonatomic, strong) UIFont   *moreFont;

@property (nonatomic, assign) NSTextAlignment tipsTextAlignment;

@end
