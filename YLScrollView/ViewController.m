//
//  ViewController.m
//  YLScrollView
//
//  Created by musjoy on 2017/9/6.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import "ViewController.h"
#import "YLScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"1");
    YLScrollView *scrollView1 = [YLScrollView new];
    NSLog(@"2");
    YLScrollView *scrollView2 = [[YLScrollView alloc]init];
    NSLog(@"3");
    YLScrollView *scrollView3 = [[YLScrollView alloc]initWithFrame:self.view.bounds];
    NSLog(@"4");
    YLScrollView *scrollView4 = [[YLScrollView alloc]initWithFrame:self.view.bounds andChildControllers:@[]];
    NSLog(@"5");
    YLScrollView *scrollView5 = [[YLScrollView alloc]initWithControllers:@[]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
