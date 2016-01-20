//
//  secondViewController.m
//  专场动画
//
//  Created by ws on 16/1/14.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "secondViewController.h"

@implementation secondViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    UIView *alertView = [[UIView alloc] init];
    alertView.bounds = CGRectMake(0, 0, 100, 100);
    alertView.center = self.view.center;
    [self.view addSubview:alertView];
    
    alertView.backgroundColor = [UIColor greenColor];
    
    
    
}

@end
