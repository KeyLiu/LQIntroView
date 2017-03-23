//
//  LQIntroPageManager.m
//  Dongci
//
//  Created by 0000 on 15/11/8.
//  Copyright © 2015年 wisdomparents. All rights reserved.
//

#import "LQIntroPageManager.h"

#define LQAPPVersion @"LQAppVersion"

@implementation LQIntroPageManager

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = self.new;
    });
    return instance;
}

- (BOOL)disPlayTheIntroPage
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:LQAPPVersion];
    if (!oldVersion || ![app_build isEqualToString:oldVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:app_build forKey:LQAPPVersion];
        return YES;
    }
    return NO;
}


@end
