//
//  YLScrollView.h
//  YLScrollView
//
//  Created by musjoy on 2017/9/6.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YLScrollViewDelegate <UIScrollViewDelegate>

- (void)scrollView:(UIScrollView *)scrollView didSelectedIndex:(NSInteger)index;

@end

@interface YLScrollView : UIView

- (instancetype)initWithFrame:(CGRect)frame andChildControllers:(__kindof UIViewController *)viewControllers;

- (instancetype)initWithControllers:(__kindof UIViewController *)viewControllers;


@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, assign) NSUInteger selectedIndex;          ///< 当前索引
@end
