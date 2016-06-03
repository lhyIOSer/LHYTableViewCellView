//
//  ViewController.m
//  LHYTableviewCell
//
//  Created by lhy on 16/5/30.
//  Copyright © 2016年 lhy. All rights reserved.
//

#import "ViewController.h"
#import "LHYTableviewCell.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *LHYTableView;

@end

static NSString * const kReuseIdentifier = @"LHYTableviewCell";

@implementation ViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

#pragma mark - Delegate
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LHYTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    cell.cellType = indexPath.row;
    switch (cell.cellType) {
        case LHYTableViewCellViewTitleRight: {
            cell.titleColor = [UIColor redColor];
            cell.titleFont = [UIFont systemFontOfSize:15];
            break;
        }
            
        case LHYTableViewCellViewLeftTitleRight: {
            cell.title = @"12345678811";
            break;
        }
            
        case LHYTableViewCellViewLeftTitleMoreRight: {
            cell.more = @"123456";
            cell.moreColor = [UIColor redColor];
            break;
        }
            
        case LHYTableViewCellViewLeftTitleTipsRight: {
            cell.tips = @"321654";
            cell.tipsColor = [UIColor redColor];
            break;
        }
            
        case LHYTableViewCellViewLeftTitleTipsMoreRight: {
            break;
        }
        
        case LHYTableViewCellViewTitleTips: {
            cell.tipsTextAlignment = NSTextAlignmentRight;
            break;
        }
        default:
            break;
    }
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - CreateUI
- (void)createUI {
    [self.view addSubview:self.LHYTableView];
    
    [self layoutUI];
}

#pragma mark - LayoutUI
- (void)layoutUI {
    [self.LHYTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}

#pragma mark - Init
- (UITableView *)LHYTableView {
    if (!_LHYTableView) {
        _LHYTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _LHYTableView.delegate = self;
        _LHYTableView.dataSource = self;
        [_LHYTableView registerClass:[LHYTableviewCell class] forCellReuseIdentifier:kReuseIdentifier];
    }
    
    return _LHYTableView;
}

@end
