//
//  YLScrollView.m
//  YLScrollView
//
//  Created by Podul on 2017/9/6.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import "YLScrollView.h"

@interface YLScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIViewController __kindof* currentController;
@property (nonatomic, copy) NSArray <__kindof UIViewController *> *viewControllers;

@end

@implementation YLScrollView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame andChildControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    if (self = [super initWithFrame:frame]) {
        self.viewControllers = viewControllers;
    }
    return self;
}

- (instancetype)initWithControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    if (self = [super init]) {
        self.viewControllers = viewControllers;
    }
    return self;
}

#pragma mark - Set & Get

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.scrollView.frame = self.bounds;
    if (self.viewControllers && self.viewControllers > 0) {
        [self.viewControllers[0].view setFrame:self.bounds];
    }
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;
    self.scrollView.contentSize = CGSizeMake(viewControllers.count * CGRectGetWidth(self.frame), 0);
    // 添加第一个
    if (viewControllers && viewControllers > 0) {
        [self.scrollView addSubview:viewControllers[0].view];
        if ([self viewController]) {
            [[self viewController] addChildViewController:viewControllers[0]];
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * selectedIndex, 0) animated:YES];
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [UIScrollView new];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

#pragma mark - UIScrollViewDelegate
/// 滚动结束后调用（setContentOffset 代码响应）
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 获得索引
    _selectedIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 添加控制器
    self.currentController = self.viewControllers[_selectedIndex];
    //如果 controller 已经存在了，不作处理
    if (self.currentController.view.superview) {
        return;
    }
    
    if ([self viewController]) {
        [[self viewController] addChildViewController:self.currentController];
    }
    self.currentController.view.frame = CGRectMake(CGRectGetWidth(self.bounds) * _selectedIndex, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    [self.scrollView addSubview:self.currentController.view];
}

/// 滚动结束（手势响应）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/// 获取当前 view 的 controller
- (UIViewController *)viewController {
    for (UIView *nextView = [self superview]; nextView; nextView = nextView.superview) {
        UIResponder *nextResponder = [nextView nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
