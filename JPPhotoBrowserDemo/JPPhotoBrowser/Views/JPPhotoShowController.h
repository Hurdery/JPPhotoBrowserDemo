//
//  JPPhotoShowController.h
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JPPhotoShowControllerDelegate <NSObject>

- (void)tapImage;

@end


//负责单张照片的显示的控制器
@interface JPPhotoShowController : UIViewController

- (instancetype)initWithImageUrl:(NSString *)url PlaceholderImage:(UIImage *)placeholderImage SelectedIndex:(NSInteger)index;

/** imageUrl */
@property(nonatomic,strong)NSString *imageUrl;
@property(nonatomic,strong)UIImage *placeholderImage;
@property(nonatomic,assign)NSInteger  selectIndex;

/** delegate */
@property(nonatomic,assign) id<JPPhotoShowControllerDelegate> delegate;


@end
