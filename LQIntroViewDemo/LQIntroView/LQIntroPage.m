//
//  LQIntroPage.m
//  LQIntroViewDemo
//
//  Created by 0000 on 15/10/9.
//  Copyright (c) 2015年 wisdomparents. All rights reserved.
//

#import "LQIntroPage.h"

@implementation LQIntroPage

+ (LQIntroPage *)page {
    LQIntroPage *newPage = [[LQIntroPage alloc] init];
    newPage.imgPositionY    = 50.0f;
    newPage.titlePositionY  = 160.0f;
    newPage.descPositionY   = 140.0f;
    newPage.title = @"";
    newPage.titleFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0];
    newPage.titleColor = [UIColor whiteColor];
    newPage.desc = @"";
    newPage.descFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    newPage.descColor = [UIColor whiteColor];
    
    return newPage;
}

+ (LQIntroPage *)pageWithCustomView:(UIView *)customV {
    LQIntroPage *newPage = [[LQIntroPage alloc] init];
    newPage.customView = customV;
    
    return newPage;
}

@end
