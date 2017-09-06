//
//  YLScrollView.m
//  YLScrollView
//
//  Created by musjoy on 2017/9/6.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import "YLScrollView.h"

@interface YLScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIViewController __kindof* currentController;

@end

@implementation YLScrollView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame andChildControllers:(__kindof UIViewController *)viewControllers {
    if (self = [super initWithFrame:frame]) {
        NSLog(@"11");
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"12");
    }
    return self;
}

- (instancetype)initWithControllers:(__kindof UIViewController *)viewControllers {
    if (self = [super init]) {
        NSLog(@"13");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"14");
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Set & Get

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.scrollView.frame = self.bounds;
}

- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    self.scrollView.contentSize = CGSizeMake(viewControllers.count * CGRectGetWidth(self.frame), 0);
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
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

#pragma mark - UIScrollViewDelegate
//滚动结束后调用（setContentOffset代码导致）
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // 获得索引
    self.selectedIndex = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    // 滚动标题栏
//    CategoryLabel *titleLable = (CategoryLabel *)self.smallScrollView.subviews[index];
//    CGFloat offsetx = titleLable.center.x - self.smallScrollView.frame.size.width * 0.5;
//    CGFloat offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
//    if (offsetx < 0) {
//        offsetx = 0;
//    }else if (offsetx > offsetMax){
//        offsetx = offsetMax;
//    }
//    CGPoint offset = CGPointMake(offsetx, self.smallScrollView.contentOffset.y);
//    [self.smallScrollView setContentOffset:offset animated:YES];
    // 添加控制器
    self.currentController = self.viewControllers[self.selectedIndex];
    //两页面所经过的标签setScale动画
//    [self.smallScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        if (idx != index) {
//            CategoryLabel *temlabel = self.smallScrollView.subviews[idx];
//            temlabel.scale = 0.0;
//        }
//    }];
    //如果 controller 已经存在了，不作处理
    if (self.currentController.view.superview) {
        return;
    }
    self.currentController.view.frame = scrollView.bounds;
    [self.scrollView addSubview:self.currentController.view];
}

//正在滚动
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    // 取出绝对值 避免最左边往右拉时形变超过1
//    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
//    NSUInteger leftIndex = (int)value;
//    NSUInteger rightIndex = leftIndex + 1;
//    CGFloat scaleRight = value - leftIndex;
//    CGFloat scaleLeft = 1 - scaleRight;
//    CategoryLabel *labelLeft = self.smallScrollView.subviews[leftIndex];
//    labelLeft.scale = scaleLeft;
//     考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
//    if (rightIndex < self.smallScrollView.subviews.count) {
//        CategoryLabel *labelRight = self.smallScrollView.subviews[rightIndex];
//        labelRight.scale = scaleRight;
//    }
//}

//滚动结束（手势导致）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
