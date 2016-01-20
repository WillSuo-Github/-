//
//  ViewController.m
//  专场动画
//
//  Created by ws on 16/1/14.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "PushTranstion.h"
#import "PopTranstion.h"

@interface ViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) PushTranstion *pushTranstion;

@property (nonatomic, strong) PopTranstion *popTranstion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 0, 100, 100);
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)check{
    
    secondViewController *second = [[secondViewController alloc] init];

    [self.navigationController pushViewController:second animated:YES];
    
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        
        return self.pushTranstion;
    }else if (operation == UINavigationControllerOperationPop){
        
        return self.popTranstion;
    }
    return nil;
}


- (PushTranstion *)pushTranstion{
    
    if (_pushTranstion == nil) {
        _pushTranstion = [[PushTranstion alloc] init];
    }
    return _pushTranstion;
}

- (PopTranstion *)popTranstion{
    
    if (_popTranstion == nil) {
        _popTranstion = [[PopTranstion alloc] init];
    }
    return _popTranstion;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
