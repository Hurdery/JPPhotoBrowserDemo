//
//  JPMoreImageView.h
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//显示多张照片的View 独立模块
@interface JPMoreImageView : UIView

/** 单张图片的URL集合 */
@property(nonatomic,strong)NSArray <NSString *>*imageUrls;

@end
