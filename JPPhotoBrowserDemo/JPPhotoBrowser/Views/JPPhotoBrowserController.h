//
//  JPPhotoBrowserController.h
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//负责多张照片的显示的控制器  负责照片交互
@interface JPPhotoBrowserController : UIViewController

/** 大图Urls */
@property(nonatomic,strong)NSArray <NSString *>*imageUrls;

/** imageViews */
@property(nonatomic,strong)NSArray <UIImageView *>*imageViews;

/** 当前点击的图片序号 */
@property(nonatomic,assign)NSInteger currentImageIndex;
@end
