//
//  LHYTableviewCell.m
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import "LHYTableviewCell.h"

@interface LHYTableviewCell ()

@property (nonatomic, strong) LHYTableViewCellView *cellView;

@end

@implementation LHYTableviewCell

#pragma mark - Lifecycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];

}

#pragma mark - Public
- (void)setCellType:(LHYTableViewCellViewType)cellType {
    _cellType = cellType;
    self.cellView.cellType = cellType;
}

- (void)setLeftImg:(UIImage *)leftImg {
    self.cellView.leftImg = leftImg;
}

- (void)setRightImg:(UIImage *)rightImg {
    self.cellView.rightImg = rightImg;
}

- (void)setTitle:(NSString *)title {
    self.cellView.title = title;
}

- (void)setTips:(NSString *)tips {
    self.cellView.tips = tips;
}

- (void)setMore:(NSString *)more {
    self.cellView.more = more;
}

- (void)setTitleColor:(UIColor *)titleColor {
    self.cellView.titleColor = titleColor;
}

- (void)setTipsColor:(UIColor *)tipsColor {
    self.cellView.tipsColor = tipsColor;
}

- (void)setMoreColor:(UIColor *)moreColor {
    self.cellView.moreColor = moreColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    self.cellView.titleFont = titleFont;
}

- (void)setTipsFont:(UIFont *)tipsFont {
    self.cellView.tipsFont = tipsFont;
}

- (void)setMoreFont:(UIFont *)moreFont {
    self.cellView.moreFont = moreFont;
}

- (void)setTipsTextAlignment:(NSTextAlignment)tipsTextAlignment {
    self.cellView.tipsTextAlignment = tipsTextAlignment;
}

#pragma mark - CreateUI
- (void)createUI {
    [self.contentView addSubview:self.cellView];
    
    [self layoutUI];
}

#pragma mark - LayoutUI
- (void)layoutUI {
    [self.cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsZero);
    }];
}

#pragma mark - Init
- (LHYTableViewCellView *)cellView {
    if (!_cellView) {
        _cellView = [[LHYTableViewCellView alloc] initWithFrame:CGRectZero];
    }
    
    return _cellView;
}

@end
