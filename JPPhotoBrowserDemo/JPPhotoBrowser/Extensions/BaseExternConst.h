//
//  BaseExternConst.h
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/5.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

// ------图片相关-------
//控制图片底部显示范围 可自定义调节
#define ImageBackViewW [UIScreen mainScreen].bounds.size.width
//图片之间的间距
extern const CGFloat ImageIntterMargin;
//图片和底部View的上下左右间距
extern const CGFloat ImageOutterMargin;

//点击图片的通知名
extern NSString *const SelectedImageNotificationName;
extern NSString *const SelectedImageNotificationImageIndexKeyName;
extern NSString *const SelectedImageNotificationImageUrlsKeyName;
extern NSString *const SelectedImageNotificationImageViewsKeyName;
