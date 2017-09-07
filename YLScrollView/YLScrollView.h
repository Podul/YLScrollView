//
//  YLScrollView.h
//  YLScrollView
//
//  Created by Podul on 2017/9/6.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLScrollView : UIView

/// 初始化时将 controller 加入
- (instancetype)initWithFrame:(CGRect)frame andChildControllers:(NSArray <__kindof UIViewController *>*)viewControllers;
- (instancetype)initWithControllers:(NSArray <__kindof UIViewController *>*)viewControllers;

/// 加入的 controller
@property (nonatomic, copy, readonly) NSArray <__kindof UIViewController *> *viewControllers;
/// 当前索引，可手动设置
@property (nonatomic, assign) NSUInteger selectedIndex;          ///< 当前索引
@end
