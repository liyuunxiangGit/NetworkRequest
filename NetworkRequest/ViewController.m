//
//  ViewController.m
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/27.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "ViewController.h"
#import "viewSection.h"
#import "viewSectionTwo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //调用方法1：
    viewSection *sec = [[viewSection alloc]init];
    [sec getDataWithSuccess:^(id result) {
        NSLog(@"%@",result);
        result;
    }];
    
    
    //调用方法2：
    viewSectionTwo *secTwo = [[viewSectionTwo alloc]initWithResultBlock:^(id result) {
        NSLog(@"%@",result);
        result;
    }];
    [secTwo exec];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
