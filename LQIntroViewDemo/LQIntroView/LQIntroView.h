//
//  LQIntroView.h
//  LQIntroViewDemo
//
//  Created by 0000 on 15/10/9.
//  Copyright (c) 2015年 wisdomparents. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQIntroPage.h"

@protocol LQIntroDelegate
@optional
- (void)introDidFinish;
@end


@interface LQIntroView : UIView<UIScrollViewDelegate>

@property (nonatomic, assign) id<LQIntroDelegate> delegate;

// titleView Y position - from top of the screen
// pageControl Y position - from bottom of the screen
@property (nonatomic, assign) bool swipeToExit;
@property (nonatomic, assign) bool hideOffscreenPages;
@property (nonatomic, retain) UIImage *bgImage;
@property (nonatomic, retain) UIView *titleView;
@property (nonatomic, assign) CGFloat titleViewY;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, assign) CGFloat pageControlY;
@property (nonatomic, retain) UIButton *skipButton;

@property (nonatomic, assign) NSInteger currentPageIndex;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *bgImageView;
@property (nonatomic, retain) UIImageView *pageBgBack;
@property (nonatomic, retain) UIImageView *pageBgFront;
@property (nonatomic, retain) NSArray *pages;

- (id)initWithFrame:(CGRect)frame andPages:(NSArray *)pagesArray;

- (void)showInView:(UIView *)view animateDuration:(CGFloat)duration;
- (void)hideWithFadeOutDuration:(CGFloat)duration;


@end
