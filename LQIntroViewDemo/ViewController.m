//
//  ViewController.m
//  LQIntroViewDemo
//
//  Created by 0000 on 17/3/23.
//  Copyright © 2017年 wisdomparents. All rights reserved.
//

#import "ViewController.h"
#import "LQIntroView.h"
#import "LQIntroPageManager.h"

@interface ViewController ()<LQIntroDelegate>

@property (nonatomic, strong) LQIntroView       *intro;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
    label.text = @"登陆页";
    label.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:label];
    
    //if ([[LQIntroPageManager sharedInstance] disPlayTheIntroPage]) {
        [self showCustomIntro];
    //}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCustomIntro {
    LQIntroPage *page1 = [LQIntroPage page];
    page1.bgImage = [UIImage imageNamed:@"欢迎页1"];
    
    LQIntroPage *page2 = [LQIntroPage page];
    page2.bgImage = [UIImage imageNamed:@"欢迎页2"];
    
    LQIntroPage *page3 = [LQIntroPage page];
    page3.bgImage = [UIImage imageNamed:@"欢迎页3"];
    
    _intro = [[LQIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    _intro.backgroundColor = [UIColor whiteColor];
    
    _intro.pageControlY = 100.0f;
    
    [_intro setDelegate:self];
    [_intro showInView:self.view animateDuration:0.0];
}

- (void)toRegisterBtnPressed{
    //注册
}

- (void)introDidFinish
{
    
}

@end
