//
//  ViewController.m
//  YLScrollView
//
//  Created by Podul on 2017/9/6.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import "ViewController.h"
#import "YLScrollView.h"
#import "ChildViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ChildViewController *VC1 = [ChildViewController new];
    VC1.title = @"11111";
    
    ChildViewController *VC2 = [ChildViewController new];
    VC2.title = @"22222";
    
    ChildViewController *VC3 = [ChildViewController new];
    VC3.title = @"33333";
    
    ChildViewController *VC4 = [ChildViewController new];
    VC4.title = @"44444";
    
    ChildViewController *VC5 = [ChildViewController new];
    VC5.title = @"55555";
    
    
    YLScrollView *scrollView = [[YLScrollView alloc]initWithFrame:self.view.bounds andChildControllers:@[
                                                                                                         VC1,
                                                                                                         VC2,
                                                                                                         VC3,
                                                                                                         VC4,
                                                                                                         VC5
                                                                                                         ]];
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
