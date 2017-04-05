//
//  MoreImageViewController.m
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import "ImageShowViewController.h"
#import "JPImageShowBackView.h"



@interface ImageShowViewController ()

@end

@implementation ImageShowViewController
{
    JPImageShowBackView      *_imageShowBackView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"多图控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //宽高可以随便写 XY必须确定
    _imageShowBackView = [[JPImageShowBackView alloc] initWithFrame:CGRectMake(0, 100, 35, 40)];
    _imageShowBackView.imageUrls = @[@"http://wx3.sinaimg.cn/mw690/66755707gy1fe9gyjk2sxj20m80m80zq.jpg",
                                     @"http://wx4.sinaimg.cn/mw690/66755707ly1febk0z9b37j20990dwwrf.jpg",
                                     @"http://wx2.sinaimg.cn/mw690/0069ptwkgy1feb1dmjg52j30hs0b8dgr.jpg",
                                     @"http://wx1.sinaimg.cn/mw690/0069ptwkgy1feb1dgzvelj31hc0xcnor.jpg",
                                     @"http://wx2.sinaimg.cn/mw690/66755707ly1feadezg850j20h80mz7e3.jpg",
                                     @"http://wx2.sinaimg.cn/mw690/66755707ly1feadf01d5ej20h80n34cb.jpg",
                                     @"http://wx3.sinaimg.cn/mw690/66755707gy1fe9jh6ovsyj20dg0f5ab1.jpg",
                                     @"http://wx4.sinaimg.cn/mw690/66755707ly1feadf0wxlsj20go0o41be.jpg",
                                     @"http://wx2.sinaimg.cn/mw690/66755707ly1feadf9082gj20b10gon6j.jpg"];
    _imageShowBackView.superController = self;
    [self.view addSubview:_imageShowBackView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_TapImageView:) name:SelectedImageNotificationName object:nil];
}


#pragma mark - tapImageView
- (void)p_TapImageView:(NSNotification *)notification {
    
    NSDictionary *infoDict = notification.userInfo;
    
}


@end
