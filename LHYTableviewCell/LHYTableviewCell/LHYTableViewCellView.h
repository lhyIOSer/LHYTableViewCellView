//
//  LHYTableViewCellView.h
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

//left:左图 title:标题 tips:说明文字 more:查看更多 right:右图
typedef NS_ENUM(NSInteger, LHYTableViewCellViewType)
{
    LHYTableViewCellViewTitleRight = 0,         //标题 右图
    LHYTableViewCellViewLeftTitleRight,         //左图 标题 右图
    LHYTableViewCellViewLeftTitleMoreRight,     //左图 标题 查看更多 右图
    LHYTableViewCellViewLeftTitleTipsRight,     //左图 标题 说明文字 右图
    LHYTableViewCellViewLeftTitleTipsMoreRight, //左图 标题 说明文字 查看更多 右图
    LHYTableViewCellViewTitleTips,              //标题 说明文字
};

@interface LHYTableViewCellView : UIView

@property (nonatomic, strong) UIImage  *leftImg;

@property (nonatomic, strong) UIImage  *rightImg;

@property (nonatomic, copy  ) NSString *title;

@property (nonatomic, copy  ) NSString *tips;

@property (nonatomic, copy  ) NSString *more;

@property (nonatomic, strong) UIColor  *titleColor;

@property (nonatomic, strong) UIColor  *tipsColor;

@property (nonatomic, strong) UIColor  *moreColor;

@property (nonatomic, strong) UIFont   *titleFont;

@property (nonatomic, strong) UIFont   *tipsFont;

@property (nonatomic, strong) UIFont   *moreFont;

@property (nonatomic, assign) NSTextAlignment tipsTextAlignment;

@property (nonatomic, assign) LHYTableViewCellViewType cellType;

@end
