//
//  LQIntroPage.h
//  LQIntroViewDemo
//
//  Created by 0000 on 15/10/9.
//  Copyright (c) 2015年 wisdomparents. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LQIntroPage : NSObject

// title image Y position - from top of the screen
// title and description labels Y position - from bottom of the screen
@property (nonatomic, retain) UIImage *bgImage;
@property (nonatomic, retain) UIImage *titleImage;
@property (nonatomic, assign) CGFloat imgPositionY;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIFont *titleFont;
@property (nonatomic, retain) UIColor *titleColor;
@property (nonatomic, assign) CGFloat titlePositionY;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) UIFont *descFont;
@property (nonatomic, retain) UIColor *descColor;
@property (nonatomic, assign) CGFloat descPositionY;

// if customView is set - all other properties are ignored
@property (nonatomic, retain) UIView *customView;

+ (LQIntroPage *)page;
+ (LQIntroPage *)pageWithCustomView:(UIView *)customV;

@end
