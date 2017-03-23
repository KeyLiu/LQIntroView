//
//  LQIntroPageManager.h
//  Dongci
//
//  Created by 0000 on 15/11/8.
//  Copyright © 2015年 wisdomparents. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQIntroView.h"
#import "LQIntroPage.h"


@interface LQIntroPageManager : NSObject

+ (instancetype)sharedInstance;

- (BOOL)disPlayTheIntroPage;

@end
