//
//  ChildViewController.m
//  YLScrollView
//
//  Created by Podul on 2017/9/7.
//  Copyright © 2017年 Podul. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()
@property (nonatomic, strong)UILabel *textLabel;
@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textLabel = [[UILabel alloc]initWithFrame:self.view.bounds];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.textColor = [UIColor blackColor];
    _textLabel.text = self.title;
    [self.view addSubview:_textLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
