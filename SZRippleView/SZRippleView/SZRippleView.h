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
/// 默认波纹高度
#define DEFAULT_WAVE_HEIGHT 10
/// 默认波纹宽度
#define DEFAULT_WAVE_WIDTH self.frame.size.width
/// 默认波纹背景色
#define DEFAULT_WAVE_BG_COLOR [UIColor whiteColor]
/// 默认波纹速度
#define DEFAULT_WAVE_SPEED 2.5f
/// 默认波纹X轴的偏移值
#define DEFAULT_WAVE_OFFSET_X 0
/// 默认波纹在Y轴的位置
#define DEFAULT_WAVE_POINT_Y 200
/// 默认波纹的振动的幅度
#define DEFAULT_WAVE_AMPLITUDE 10
/// 默认波纹周期
#define DEFAULT_WAVE_period 1.29 * M_PI/_waveWidth

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



- (instancetype)initWithFrame:(CGRect)frame startColor:(UIColor *)sColor endColor:(UIColor *)eColo;

@end
