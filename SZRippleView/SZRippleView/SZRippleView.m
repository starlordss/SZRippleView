
//
//  SZRippleView.m
//  SZRippleView
//
//  Created by Zahi on 2017/10/17.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "SZRippleView.h"

@interface SZRippleView ()
@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CAShapeLayer *shapeLayer1;
@property (nonatomic, strong) CAShapeLayer *shapeLayer2;
@property (nonatomic, strong) CAGradientLayer *gradientLayer1;
@property (nonatomic, strong) CAGradientLayer *gradientLayer2;

@end

@implementation SZRippleView

#pragma mark -initialize-
+ (instancetype)rippleViewWithFrame:(CGRect)frame startColor:(UIColor *)sColor endColor:(UIColor *)eColor
{
    return [[self alloc] initWithFrame:frame startColor:sColor endColor:eColor];
}

- (instancetype)initWithFrame:(CGRect)frame startColor:(UIColor *)sColor endColor:(UIColor *)eColor
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _startColor = sColor;
        _endColor = eColor;
        self.backgroundColor = SZHexColorA(0xedf0f4, 0.1f);
        self.layer.masksToBounds = YES;
    }
    return self;
   
}

@end
