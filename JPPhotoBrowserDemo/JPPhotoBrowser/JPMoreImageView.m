//
//  JPMoreImageView.m
//  JPPhotoBrowserDemo
//
//  Created by tztddong on 2017/4/1.
//  Copyright © 2017年 dongjiangpeng. All rights reserved.
//

#import "JPMoreImageView.h"
#import "UIView+JP_Frame.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

static CGFloat imageIntterMargin = 8;
static CGFloat imageOutterMargin = 12;

@implementation JPMoreImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self p_SetupImagesUI];
    }
    return self;
}

#pragma mark - 设置图片UI
- (void)p_SetupImagesUI{
    
//    self.backgroundColor = self.superview.backgroundColor;
    self.backgroundColor = [UIColor yellowColor];
    
    //超出边界的内容不显示
    self.clipsToBounds = YES;
    
    //行列数
    NSInteger count = 3;
    
    for (NSInteger i = 0; i < count*count; i++) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.backgroundColor = [UIColor orangeColor];
        imageV.hidden = YES;
        [self addSubview:imageV];
        
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.clipsToBounds = YES;
        
        //计算行列
        NSInteger row = i / count;
        NSInteger col = i % count;
        
        //图片的宽高
        CGFloat imageWH = (ScreenW - 2*imageOutterMargin -2*imageIntterMargin)/3;
        
        //计算x/y
        CGFloat imageX = col * (imageWH + imageIntterMargin) + imageOutterMargin;
        CGFloat imageY = row * (imageWH + imageIntterMargin) + imageOutterMargin;
        
        imageV.frame = CGRectMake(imageX, imageY, imageWH, imageWH);
        
        //记录tag值
        imageV.tag = i;
        
        //添加手势
        imageV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_TapImageView:)];
        [imageV addGestureRecognizer:tap];
    }
}

#pragma mark -设置图片
- (void)setImageUrls:(NSArray<NSString *> *)imageUrls {
    
    _imageUrls = imageUrls;
    
    for (NSInteger i = 0; i < imageUrls.count; i++) {
        
        UIImageView *imageV;
        
        imageV = (UIImageView *)self.subviews[i];
        
        //四张图特殊处理
        if (i > 1 & imageUrls.count == 4) {
            imageV = (UIImageView *)self.subviews[i+1];
        }
        imageV.hidden = NO;
    }
    
    self.jp_h = [self p_UpdateViewHeightWithImageCount:imageUrls.count].height;
    self.jp_w = [self p_UpdateViewHeightWithImageCount:imageUrls.count].width;
}

#pragma mark -根据图片的个数更新View高度
- (CGSize)p_UpdateViewHeightWithImageCount:(NSInteger)imageCount{
    
    if (imageCount == 0) {
        
        return CGSizeMake(0, 0);
    }
    
    if (imageCount == 1) {
        
        return CGSizeMake(ScreenW-2*imageOutterMargin, (ScreenW-2*imageOutterMargin)*9/16.0);
    }
    
    //共几行
    NSInteger row = (imageCount - 1)/3 +1;
    
    //图片的宽高
    CGFloat imageWH = (ScreenW - 2*imageOutterMargin -2*imageIntterMargin)/3;
    
    return CGSizeMake(ScreenW, imageOutterMargin + row*imageWH +(row-1)*imageIntterMargin);
}

#pragma mark -点击图片
- (void)p_TapImageView:(UIGestureRecognizer *)gesture{
    
    
}

@end
