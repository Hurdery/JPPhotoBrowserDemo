//
//  ViewController.m
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import "ViewController.h"
#import "ImageShowViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ClickMe:(id)sender {
    
    ImageShowViewController *imageShowVC = [[ImageShowViewController alloc] init];
    [self.navigationController pushViewController:imageShowVC animated:YES];
}

@end
