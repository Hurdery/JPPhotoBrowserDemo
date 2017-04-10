//
//  JPPhotoBrowserController.m
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import "JPPhotoBrowserController.h"
#import "JPPhotoShowController.h"

@interface JPPhotoBrowserController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,JPPhotoShowControllerDelegate>

@end

@implementation JPPhotoBrowserController
{
    JPPhotoShowController   *_currentPhotoShowController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self p_SetupPageUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 设置分页控制器 */
- (void)p_SetupPageUI {
    //UIPageViewControllerTransitionStyleScroll滑动换页  UIPageViewControllerNavigationOrientationHorizontal横向滚动  UIPageViewControllerOptionInterPageSpacingKey页间距
    UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{@"UIPageViewControllerOptionInterPageSpacingKey":@20}];
    
    JPPhotoShowController *showController = [[JPPhotoShowController alloc] initWithImageUrl:self.imageUrls[self.currentImageIndex] PlaceholderImage:self.imageViews[self.currentImageIndex].image SelectedIndex:self.currentImageIndex];
    _currentPhotoShowController = showController;
    showController.delegate = self;
    //设置show为page的子控制器
    [pageViewController setViewControllers:@[showController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //将分页控制器添加为当前的子控制器
    [self.view addSubview:pageViewController.view];
    [self addChildViewController:pageViewController];
    [pageViewController didMoveToParentViewController:self];
    
    //代理
    pageViewController.delegate = self;
    pageViewController.dataSource = self;
    
    //设置手势
    self.view.gestureRecognizers = pageViewController.gestureRecognizers;
}


/**
 返回前一页控制器

 @param pageViewController pageViewController description
 @param viewController 当前显示的控制器
 @return 返回前一页控制器 返回Nil 就是到头了
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    //取出当前控制器的序号
    JPPhotoShowController *currentCtrl = (JPPhotoShowController *)viewController;
    NSInteger index = currentCtrl.selectIndex;
    //判断是否已经滑动到最前面一页
    if (index <= 0) {
        return nil;
    }
    index --;
    JPPhotoShowController *beforeCtrl = [[JPPhotoShowController alloc] initWithImageUrl:self.imageUrls[index] PlaceholderImage:self.imageViews[index].image SelectedIndex:index];
    beforeCtrl.delegate = self;
    return beforeCtrl;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    //取出当前控制器的序号
    JPPhotoShowController *currentCtrl = (JPPhotoShowController *)viewController;
    NSInteger index = currentCtrl.selectIndex;
    //判断是否已经滑动到最后面一页
    if (index >= self.imageUrls.count-1) {
        return nil;
    }
    index ++;
    JPPhotoShowController *afterCtrl = [[JPPhotoShowController alloc] initWithImageUrl:self.imageUrls[index] PlaceholderImage:self.imageViews[index].image SelectedIndex:index];
    afterCtrl.delegate = self;
    return afterCtrl;

}

- (void)tapImage {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
