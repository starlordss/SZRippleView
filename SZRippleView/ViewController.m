//
//  ViewController.m
//  SZRippleView
//
//  Created by Zahi on 2017/10/17.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "SZRippleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SZHexColor(0xfafbff);
    
    SZRippleView *rippleView = [[SZRippleView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 250) startColor:SZHexColorA(0x90cfed, 0.7) endColor:SZHexColorA(0xff785c, 0.7)];
    
    [self.view addSubview:rippleView];
    
    
    
    
}

@end
