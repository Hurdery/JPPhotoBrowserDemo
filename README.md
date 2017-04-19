# JPPhotoBrowserDemo       

- 需要将文件夹 JPPhotoBrowser 拖入程序中  

----------

### 目录结构 
- #### Extensions    
- UIImageView+JPWebImage 图片下载
- UIView+JP_Frame 重写个头/set方法
- #### Views
- JPImageShowBackView 九宫格布局View(若存在不必引用 可删除)
- JPPhotoBrowserController 负责照片浏览的控制器
- JPPhotoShowController 负责单张照片显示的控制器
- JPPhotoBrowserAnimator 自定义转场

----------

##### JPPhotoBrowser一个简单的多图大图浏览框架,有两种使用方法.
- 1- 已经存在九宫格小图的View,点击小图需要展示大图进行浏览(可删除 JPImageShowBackView)
- 2- 不存在九宫格小图View,但需要实现九宫格小图布局并且带有点击浏览大图的功能 

----------
### 具体使用      


```
//对于第一种情况下 在点击单张小图时 掉用以下代码即可
//imageUrls 大图的Url集合
//imageViews 小图的View的集合
//currentImageIndex 当前点击的序号
JPPhotoBrowserController *photoController = [[JPPhotoBrowserController alloc] initWithImageUrls:self.largeImageUrls imageViews:imageViews index:currentImageIndex];
//如果此处不指定自定义转场 那么会使用默认的转场
photoController.modalPresentationStyle = UIModalPresentationCustom;
[self.superController presentViewController:photoController animated:YES completion:nil];

```

```
//对于第二种情况下 在需要展示九宫格的控制器(控制器的View上)加上九宫格展示View 后续逻辑无需再管 三个属性为必传
//宽高可以随便写 XY必须确定
_imageShowBackView = [[JPImageShowBackView alloc] initWithFrame:CGRectMake(0, 100, 0, 0)];
//小图的URL集合
_imageShowBackView.smallImageUrls = smallImageUrls;
//大图的URL集合 保证两个数组个数相同
_imageShowBackView.largeImageUrls = largeImageUrls;
//需要执行跳转的控制器(一般为当前View所在的控制器)
_imageShowBackView.superController = self;
[self.view addSubview:_imageShowBackView];

```

![image](https://github.com/baiyidjp/JPPhotoBrowserDemo/blob/master/GifImages/photoBrowser.gif?raw=true)     


![image](https://github.com/baiyidjp/JPPhotoBrowserDemo/blob/master/GifImages/photoBrowser1.gif?raw=true)     


![image](https://github.com/baiyidjp/JPPhotoBrowserDemo/blob/master/GifImages/photoBrowser4.gif?raw=true)     



![image](https://github.com/baiyidjp/JPPhotoBrowserDemo/blob/master/GifImages/photoBrowser5.gif?raw=true)   


