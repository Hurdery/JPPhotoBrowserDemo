//
//  MoreImageViewController.m
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import "MoreImageViewController.h"
#import "JPMoreImageView.h"

@interface MoreImageViewController ()

@end

@implementation MoreImageViewController
{
    JPMoreImageView      *_moreImageBackView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"多图控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //宽高可以随便写 XY必须确定
    _moreImageBackView = [[JPMoreImageView alloc] initWithFrame:CGRectMake(0, 100, 35, 40)];
    _moreImageBackView.imageUrls = @[@"111",@"111",@"111",@"111"];
    [self.view addSubview:_moreImageBackView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
