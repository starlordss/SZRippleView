//
//  SZRippleView.h
//  SZRippleView
//
//  Created by Zahi on 2017/10/17.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 二进制表示颜色
#define SZHexColor(hexValue) SZHexColorA(hexValue, 1.0)

#define SZHexColorA(hexValue, a) [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0 green:((float)(((hexValue) & 0xFF00) >> 8))/255.0 blue:((float)((hexValue) & 0xFF))/255.0 alpha:a]

/// 一款底部水波动画的view控件
@interface SZRippleView : UIView

/** 振幅*/
@property (nonatomic, assign) CGFloat amplitude;
/** 周期*/
@property (nonatomic, assign) CGFloat period;
/** 速度*/
@property (nonatomic, assign) CGFloat speed;
/** 波纹的高度*/
@property (nonatomic, assign) CGFloat waveHeight;
/** 波纹的宽度*/
@property (nonatomic, assign) CGFloat waveWidth;
/** 波纹的Y值*/
@property (nonatomic, assign) CGFloat wavePointY;
/** 波浪x位移*/
@property (nonatomic, assign) CGFloat waveOffsetX;
/** 波浪颜色*/
@property (nonatomic, strong) UIColor *waveColor;



+ (instancetype)rippleViewWithFrame:(CGRect)frame startColor:(UIColor *)sColor endColor:(UIColor *)eColor;

@end
