//
//  LHYTableViewCellView.m
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import "LHYTableViewCellView.h"
#import "NSString+CalcSize.h"
#import "UIView+Frame.h"

@interface LHYTableViewCellView ()

@property (nonatomic, strong) UIImageView *leftImgView;

@property (nonatomic, strong) UIImageView *rightImgView;

@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) UILabel *tipsLbl;

@property (nonatomic, strong) UILabel *moreLbl;

@end

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

@implementation LHYTableViewCellView

#pragma mark - Lifecycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - Public
#pragma mark 设置左边图标
- (void)setLeftImg:(UIImage *)leftImg {
    //如果为空表示隐藏图标
    if (!leftImg) {
        self.leftImgView.hidden = YES;
        
        CGFloat txtWidth = [self.titleLbl.text calcTextWidthText:self.titleLbl.text withWidth:kScreenWidth withAttributes:@{NSFontAttributeName:self.titleLbl.font}];
        [self.titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(txtWidth);
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
        }];
    } else {
        self.leftImgView.hidden = NO;
        self.leftImgView.image = leftImg;
    }
}

#pragma mark 设置右边图标
- (void)setRightImg:(UIImage *)rightImg {
    //如果为空表示隐藏图标
    if (!rightImg) {
        self.rightImgView.hidden = YES;
        
        [self.moreLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.tipsLbl.mas_right).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.right.equalTo(self.mas_right).offset(10);
        }];
    } else {
        self.rightImgView.hidden = NO;
        self.rightImgView.image = rightImg;
        CGSize imgSize = rightImg.size;
        [self.rightImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.offset(imgSize.width);
            make.height.offset(imgSize.height);
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).offset(-10);
        }];
    }
}

#pragma mark 设置cell类型
- (void)setCellType:(LHYTableViewCellViewType)cellType {
    _cellType = cellType;
    switch (cellType) {
        case LHYTableViewCellViewTitleRight: {
            self.leftImgView.hidden = YES;
            self.leftImgView.width = 0;
            
            CGFloat txtWidth = [self.titleLbl.text calcTextWidthText:self.titleLbl.text withWidth:kScreenWidth withAttributes:@{NSFontAttributeName:self.titleLbl.font}];
            [self.titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.offset(txtWidth);
                make.top.equalTo(self.mas_top).offset(10);
                make.left.equalTo(self.mas_left).offset(10);
                make.bottom.equalTo(self.mas_bottom).offset(-10);
            }];
            
            self.tipsLbl.hidden = YES;
            self.tipsLbl.width = 0;
            
            self.moreLbl.hidden = YES;
            self.moreLbl.width = 0;
            break;
        }
            
        case LHYTableViewCellViewLeftTitleRight: {
            self.tipsLbl.hidden = YES;
            self.tipsLbl.width = 0;
            
            self.moreLbl.hidden = YES;
            self.moreLbl.width = 0;
            break;
        }
            
        case LHYTableViewCellViewLeftTitleMoreRight: {
            self.tipsLbl.hidden = YES;
            self.tipsLbl.width = 0;
            break;
        }
            
        case LHYTableViewCellViewLeftTitleTipsRight: {
            self.moreLbl.hidden = YES;
            self.moreLbl.width = 0;
            break;
        }
            
        case LHYTableViewCellViewLeftTitleTipsMoreRight: {
            break;
        }
            
        case LHYTableViewCellViewTitleTips: {
            self.leftImgView.hidden = YES;
            self.leftImgView.width = 0;
            
            self.moreLbl.hidden = YES;
            
            self.rightImgView.hidden = YES;
            self.rightImgView.width = 0;
            
            CGFloat txtWidth = [self.titleLbl.text calcTextWidthText:self.titleLbl.text withWidth:kScreenWidth withAttributes:@{NSFontAttributeName:self.titleLbl.font}];
            [self.titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.offset(txtWidth);
                make.centerY.equalTo(self.mas_centerY);
                make.left.equalTo(self.mas_left).offset(10);
            }];
            
            [self.moreLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.offset(0);
                make.centerY.equalTo(self.mas_centerY);
                make.left.equalTo(self.tipsLbl.mas_right).offset(10);
                make.right.equalTo(self.mas_right).offset(0);
            }];
            break;
        }
        default:
            break;
    }
}

- (void)setTitle:(NSString *)title {
    if (!title) {
        return;
    }
    
    if ([title isEqualToString:self.titleLbl.text]) {
        return;
    }
    
    self.titleLbl.text = title;
    [self setCellType:self.cellType];
}

- (void)setTips:(NSString *)tips {
    if (!tips) {
        return;
    }
    
    if ([tips isEqualToString:self.tipsLbl.text]) {
        return;
    }
    
    self.tipsLbl.text = tips;
}

- (void)setMore:(NSString *)more {
    if (!more) {
        return;
    }
    
    if ([more isEqualToString:self.moreLbl.text]) {
        return;
    }
    
    self.moreLbl.text = more;
}

- (void)setTitleColor:(UIColor *)titleColor {
    if (!titleColor) {
        return;
    }
    
    self.titleLbl.textColor = titleColor;
}

- (void)setTipsColor:(UIColor *)tipsColor {
    if (!tipsColor) {
        return;
    }
    
    self.tipsLbl.textColor = tipsColor;
}

- (void)setMoreColor:(UIColor *)moreColor {
    if (!moreColor) {
        self.moreColor = moreColor;
    }
    
    self.moreLbl.textColor = moreColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    if (!titleFont) {
        return;
    }
    
    self.titleLbl.font = titleFont;
}

- (void)setTipsFont:(UIFont *)tipsFont {
    if (!tipsFont) {
        return;
    }
    
    self.tipsLbl.font = tipsFont;
}

- (void)setMoreFont:(UIFont *)moreFont {
    if (!moreFont) {
        return;
    }
    
    self.moreLbl.font = moreFont;
}

- (void)setTipsTextAlignment:(NSTextAlignment)tipsTextAlignment {
    self.tipsLbl.textAlignment = tipsTextAlignment;
}

#pragma mark - CreateUI
- (void)createUI {
    [self addSubview:self.leftImgView];
    [self addSubview:self.titleLbl];
    [self addSubview:self.tipsLbl];
    [self addSubview:self.moreLbl];
    [self addSubview:self.rightImgView];
    
    [self layoutUI];
}

#pragma mark - LayoutUI
- (void)layoutUI {
    [self.leftImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(20);
        make.height.offset(20);
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
    }];
    
    CGFloat txtWidth = [self.titleLbl.text calcTextWidthText:self.titleLbl.text withWidth:kScreenWidth withAttributes:@{NSFontAttributeName:self.titleLbl.font}];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(txtWidth);
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.leftImgView.mas_right).offset(10);
    }];
    
    [self.tipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.titleLbl.mas_right).offset(10);
        make.right.equalTo(self.moreLbl.mas_left).offset(-10);
    }];
    
    [self.moreLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.tipsLbl.mas_right).offset(10);
        make.right.equalTo(self.rightImgView.mas_left).offset(0);
    }];
    
    CGSize imgSize = self.rightImgView.image.size;
    [self.rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(imgSize.width);
        make.height.offset(imgSize.height);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
}

#pragma mark - Init
- (UIImageView *)leftImgView {
    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personalcenter_Invitation"]];
        _leftImgView.contentMode = UIViewContentModeScaleAspectFit;
        _leftImgView.clipsToBounds = YES;
    }
    
    return _leftImgView;
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLbl.text = @"开始时间";
    }
    
    return _titleLbl;
}

- (UILabel *)tipsLbl {
    if (!_tipsLbl) {
        _tipsLbl = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipsLbl.font = [UIFont systemFontOfSize:15];
        _tipsLbl.textColor = [UIColor lightGrayColor];
        _tipsLbl.text = @"选择活动开始时间";
    }
    
    return _tipsLbl;
}

- (UILabel *)moreLbl {
    if (!_moreLbl) {
        _moreLbl = [[UILabel alloc] initWithFrame:CGRectZero];
        _moreLbl.font = [UIFont systemFontOfSize:14];
        _moreLbl.textColor = [UIColor darkGrayColor];
        _moreLbl.textAlignment = NSTextAlignmentRight;
        _moreLbl.text = @"查看更多";
    }
    
    return _moreLbl;
}

- (UIImageView *)rightImgView {
    if (!_rightImgView) {
        _rightImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    }
    
    return _rightImgView;
}

@end
