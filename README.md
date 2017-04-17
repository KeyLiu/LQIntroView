# LQIntroView
引导页是app下载后打开的第一页，也决定着用户对软件的第一印象。在很多app中都是以多张图片通过滚动的方式介绍软件的内容，但形式过于单调。现今app中，有通过视频形式介绍（如keep等），都是在加强软件的吸引力。下面这个框架这是曾经一个项目中使用的框架，当然还是以图片为主，但加入了透明度渐变的效果，正价注重用户体验。先来看效果：

![](http://upload-images.jianshu.io/upload_images/1378903-bb29a10910ac81a9.gif?imageMogr2/auto-orient/strip)

- Demo地址：https://github.com/KeyLiu/LQIntroView.git

##简述

- `LQIntroPageManager` 引导页管理类，主要控制引导页只显示一次（app初次下载或更新时）
- `LQIntroView` 引导页视图，设置引导页的一些效果
- `LQIntroPage` 具体引导页，可设置图片，文字等

##使用
- 1.创建若干`LQIntroPage`，设置每一页的图片、文字
- 2.创建`LQIntroView`，通过`initWithFrame:(CGRect)frame andPages:(NSArray *)pagesArray`方法传入`LQIntroPage`数组
- 3.设置代理(引导页结束时调用)
- 4.通过`showInView:(UIView *)view animateDuration:(CGFloat)duration`将其添加到当前view上


    @property (nonatomic, strong) LQIntroView       *intro;

    - (void)showCustomIntro {
        LQIntroPage *page1 = [LQIntroPage page];
        page1.bgImage = [UIImage imageNamed:@"欢迎页1"];
    
        LQIntroPage *page2 = [LQIntroPage page];
        page2.bgImage = [UIImage imageNamed:@"欢迎页2"];
    
        LQIntroPage *page3 = [LQIntroPage page];
        page3.bgImage = [UIImage imageNamed:@"欢迎页3"];
    
        _intro = [[LQIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
        [_intro setDelegate:self];
        [_intro showInView:self.view animateDuration:0.0];
    }

- 5.调用方法，通过`[[LQIntroPageManager sharedInstance] disPlayTheIntroPage]`判断是否执行


    if ([[LQIntroPageManager sharedInstance] disPlayTheIntroPage]) {
        [self showCustomIntro];
    }

##主要方法

- LQIntroPageManager

单例类初始化
    
      + (instancetype)sharedInstance;

是否需要显示（安装后首次显示）

      - (BOOL)disPlayTheIntroPage;

- LQIntroView

设置大小及数组

    - (id)initWithFrame:(CGRect)frame andPages:(NSArray *)pagesArray;

设置位置及出现动画时间

    - (void)showInView:(UIView *)view animateDuration:(CGFloat)duration;

设置消失时间

    - (void)hideWithFadeOutDuration:(CGFloat)duration;

- LQIntroPage

初始化
    + (LQIntroPage *)page;

自定义初始化

    + (LQIntroPage *)pageWithCustomView:(UIView *)customV;

- LQIntroDelegate

处理消失后要做的事

    - (void)introDidFinish;

##补充
兼容iPad和iPhone

因为在我的项目中要求iPad和iPhone兼容，即一个包同时支持两种设备，所以浅谈一下版本兼容和这个view的改法。在项目中，遇到同一个项目同时兼容iPad和iPhone时往往希望能够用最少量的代码完成。

我在做兼容时会定义两个宏

    //适配iPhone尺寸
    #define SIZE_SCALE_IPHONE6(x)   (x * ([UIScreen mainScreen].bounds.size.width / 375))
    //适配iPad尺寸
    #define SIZE_SCALE_IPADAIR(x)   (x * ([UIScreen mainScreen].bounds.size.width / 768))

在使用时如字体，定义大小时加上这个宏，如在Masory中：

    make.top.equalTo(_loginBtn.mas_bottom).with.offset(SIZE_SCALE_IPHONE6(10));

一般情况下，会通过`UI_USER_INTERFACE_IDIOM()`判断当前设备是iPhone还是iPad，然后执行不同的代码。  其枚举类型如下：

    typedef NS_ENUM(NSInteger, UIUserInterfaceIdiom) {
        UIUserInterfaceIdiomUnspecified = -1,
        UIUserInterfaceIdiomPhone NS_ENUM_AVAILABLE_IOS(3_2), // iPhone and iPod touch style UI
        UIUserInterfaceIdiomPad NS_ENUM_AVAILABLE_IOS(3_2), // iPad style UI
        UIUserInterfaceIdiomTV NS_ENUM_AVAILABLE_IOS(9_0), // Apple TV style UI
        UIUserInterfaceIdiomCarPlay NS_ENUM_AVAILABLE_IOS(9_0), // CarPlay style UI
    };

在`LQIntroView`中若要修改需手动修改

感谢查看，希望多多指正！

