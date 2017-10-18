
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

- (instancetype)initWithFrame:(CGRect)frame startColor:(UIColor *)sColor endColor:(UIColor *)eColor
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _startColor = sColor;
        _endColor = eColor;
        self.backgroundColor = SZHexColorA(0xedf0f4, 0.1f);
        self.layer.masksToBounds = YES;
        
        [self settingParams];
        [self beganToWave];
    }
    return self;
}

#pragma mark - Configuration parameters
- (void)settingParams {
    if (!_waveWidth) {
        _waveWidth = DEFAULT_WAVE_WIDTH;
    }
    if (!_waveHeight) {
        _waveHeight = DEFAULT_WAVE_HEIGHT;
    }
    if (!_waveColor) {
        _waveColor = [UIColor whiteColor];
    }
    
    if (!_speed) {
        _speed = DEFAULT_WAVE_SPEED;
    }
    if (!_waveOffsetX) {
        _waveOffsetX = DEFAULT_WAVE_OFFSET_X;
    }
    if (!_wavePointY) {
        _wavePointY = DEFAULT_WAVE_POINT_Y;
    }
    if (!_amplitude) {
        _amplitude = DEFAULT_WAVE_AMPLITUDE;
    }
    if (!_period) {
        _period =  DEFAULT_WAVE_period;
    }
}

#pragma mark - start wave
- (void)beganToWave {
    
    [self.layer addSublayer:self.shapeLayer1];
    [self.layer addSublayer:self.shapeLayer2];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)currentWave {
    _waveOffsetX += _speed;
    
    [self changeWaveLayerPath1];
    [self changeWaveLayerPath2];
    
    [self.layer addSublayer:self.gradientLayer1];
    self.gradientLayer1.mask = _shapeLayer1;
    [self.layer addSublayer:self.gradientLayer2];
    self.gradientLayer2.mask = _shapeLayer2;
    
}

- (void)changeWaveLayerPath1 {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waveWidth; x ++) {
        y = _amplitude * 1.6 * sin((250 / _waveWidth) * (x * M_PI / 180) - _waveOffsetX * M_PI / 270) + _wavePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waveWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    CGPathCloseSubpath(path);
    
    _shapeLayer1.path = path;
    CGPathRelease(path);
}

- (void)changeWaveLayerPath2 {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waveWidth; x ++) {
        
        y = _amplitude * 1.6 * sin((250 / _waveWidth) * (x * M_PI / 180) - _waveOffsetX * M_PI / 180) + _wavePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waveWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    CGPathCloseSubpath(path);
    
    _shapeLayer2.path = path;
    
    CGPathRelease(path);
}

#pragma mark - get


- (CAGradientLayer *)gradientLayer1
{
    if (_gradientLayer1 == nil) {
        _gradientLayer1 = [CAGradientLayer layer];
        _gradientLayer1.frame = self.bounds;
        _gradientLayer1.colors = @[( id)self.startColor.CGColor, (id)self.endColor.CGColor];
        _gradientLayer1.locations = @[@0, @1.0];
        _gradientLayer1.startPoint = CGPointMake(0, 0);
        _gradientLayer1.endPoint = CGPointMake(1.0, 0);
    }
    
    return _gradientLayer1;
}

- (CAGradientLayer *)gradientLayer2
{
    if (_gradientLayer2 == nil) {
        _gradientLayer2 = [CAGradientLayer layer];
        _gradientLayer2.frame = self.bounds;
        _gradientLayer2.colors = @[( id)self.startColor.CGColor, (id)self.endColor.CGColor];
        _gradientLayer2.locations = @[@0, @1.0];
        _gradientLayer2.startPoint = CGPointMake(0, 0);
        _gradientLayer2.endPoint = CGPointMake(1.0, 0);
    }
    
    return _gradientLayer2;
}

- (CAShapeLayer *)shapeLayer1
{
    if (_shapeLayer1 == nil) {
        
        _shapeLayer1 = [CAShapeLayer layer];
    }
    return _shapeLayer1;
}

- (CAShapeLayer *)shapeLayer2
{
    if (_shapeLayer2 == nil) {
        
        _shapeLayer2 = [CAShapeLayer layer];
        
    }
    return _shapeLayer2;
}

- (CADisplayLink *)displayLink
{
    if (_displayLink == nil) {
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(currentWave)];
    }
    return _displayLink;
}

- (void)dealloc
{
    [_displayLink invalidate];
    
    _displayLink = nil;
}

@end
