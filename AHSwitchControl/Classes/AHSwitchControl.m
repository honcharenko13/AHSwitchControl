//
//  AHSwitchControl.m
//  Pods
//
//  Created by Aleksandr on 06.06.16.
//
//

#import "AHSwitchControl.h"

#define AHSwitchControlDefaultInitialBackgroundColor ([UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1.00])
#define AHSwitchControlDefaultFinalBackgroundColor ([UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.00])

#define AHSwitchControlDefaultInitialThumbBorderColor ([UIColor colorWithRed:0.737 green:0.745 blue:0.737 alpha:1.00])
#define AHSwitchControlDefaultFinalThumbBorderColor ([UIColor colorWithRed:0.271 green:0.804 blue:0.580 alpha:1.00])
#define AHSwitchControlDefaultInitialThumbBackgroundColor ([UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.00])
#define AHSwitchControlDefaultFinalThumbBackgroundColor ([UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.00])
#define AHSwitchControlDefaultInitialThumbTintColor ([UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1.00])
#define AHSwitchControlDefaultFinalThumbTintColor ([UIColor colorWithRed:0.271 green:0.804 blue:0.580 alpha:1.00])
#define AHSwitchControlDefaultThumbLayerShadowColor ([UIColor blackColor])
#define AHSwitchControlDefaultBackgroundColor ([UIColor clearColor])

static CGFloat const kAHSwitchControlDefaultSwitchWidth = 55.f;
static CGFloat const kAHSwitchControlDefaultSwitchHeight = 35.f;
static CGFloat const kAHSwitchControlDefaultInset = 7.f;

static CGFloat const kAHSwitchControlDefaultInitialThumbCircleRadius = 11.f;
static CGFloat const kAHSwitchControlDefaultFinalThumbCircleRadius = 16.f;
static CGFloat const kAHSwitchControlDefaultInitialThumbBorderWidth = 2.f;
static CGFloat const kAHSwitchControlDefaultFinalThumbBorderWidth  = 4.f;
static CGFloat const kAHSwitchControlDefaultShadowRadius = 1.f;

@interface AHSwitchControl ()

@property (strong, nonatomic) CAShapeLayer *backLayer;
@property (strong, nonatomic) CAShapeLayer *maskLayer;
@property (strong, nonatomic) CAShapeLayer *thumbLayer;
@property (strong, nonatomic) CAShapeLayer *thumbCenterLayer;
@property (strong, nonatomic) CAShapeLayer *backShadowLayer;

@property (nonatomic, readonly) UIEdgeInsets thumbCenterLayerInsets;

@end

@implementation AHSwitchControl

#pragma mark - Properties

- (void)setOn:(BOOL)on {
    [self setOn:on animated:YES];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated {
    if (_on != on) {
        [self willChangeValueForKey:@"on"];
        _on = on;
        [self updateUIAnimated:animated];
        [self didChangeValueForKey:@"on"];
    }
}

- (void)setInitialBackgroundColor:(UIColor *)initialBackgroundColor {
    _initialBackgroundColor = initialBackgroundColor;
    [self setNeedsLayout];
}

- (void)setFinalBackgroundColor:(UIColor *)finalBackgroundColor {
    _finalBackgroundColor = finalBackgroundColor;
    [self setNeedsLayout];
}

- (void)setInitialThumbTintColor:(UIColor *)initialThumbTintColor {
    _initialThumbTintColor = initialThumbTintColor;
    [self setNeedsLayout];
}

- (void)setFinalThumbTintColor:(UIColor *)finalThumbTintColor {
    _finalThumbTintColor =  finalThumbTintColor;
    [self setNeedsLayout];
}

- (void)setInitialThumbBorderColor:(UIColor *)initialThumbBorderColor {
    _initialThumbBorderColor = initialThumbBorderColor;
    [self setNeedsLayout];
}

- (void)setFinalThumbBorderColor:(UIColor *)finalThumbBorderColor {
    _finalThumbBorderColor = finalThumbBorderColor;
    [self setNeedsLayout];
}

- (void)setSwitchHeight:(CGFloat)switchHeight {
    _switchHeight = switchHeight;
    [self setNeedsLayout];
}

- (void)setSwitchWidth:(CGFloat)switchWidth {
    _switchWidth = switchWidth;
    [self setNeedsLayout];
}

- (void)setInitialThumbCircleRadius:(CGFloat)initialThumbCircleRadius {
    _initialThumbCircleRadius = initialThumbCircleRadius;
    [self setNeedsLayout];
}

- (void)setFinalThumbCircleRadius:(CGFloat)finalThumbCircleRadius {
    _finalThumbCircleRadius = finalThumbCircleRadius;
    [self setNeedsLayout];
}

- (void)setInitialThumbBorderWidth:(CGFloat)initialThumbBorderWidth {
    _initialThumbBorderWidth = initialThumbBorderWidth;
    [self setNeedsLayout];
}

- (void)setFinalThumbBorderWidth:(CGFloat)finalThumbBorderWidth {
    _finalThumbBorderWidth = finalThumbBorderWidth;
    [self setNeedsLayout];
}

- (void)setInset:(CGFloat)inset {
    _inset = inset;
}

- (void)setThumbLayerShadowColor:(UIColor *)thumbLayerShadowColor {
    _thumbLayerShadowColor = thumbLayerShadowColor;
    [self setNeedsLayout];
}

- (void)setThumbShadowRadius:(CGFloat)thumbShadowRadius {
    _thumbShadowRadius = thumbShadowRadius;
    [self setNeedsLayout];
}

- (UIEdgeInsets)thumbCenterLayerInsets {
    CGFloat thumbCircleRadius = self.isOn ? self.finalThumbCircleRadius : self.initialThumbCircleRadius;
    CGFloat inset = (self.switchHeight - thumbCircleRadius) / 2;
    return UIEdgeInsetsMake(inset, inset, inset, inset);
}

#pragma mark - Init

- (void)setupDefaultProperties {
    _initialBackgroundColor = AHSwitchControlDefaultInitialBackgroundColor;
    _finalBackgroundColor = AHSwitchControlDefaultFinalBackgroundColor;
    
    _initialThumbBorderColor = AHSwitchControlDefaultInitialThumbBorderColor;
    _finalThumbBorderColor = AHSwitchControlDefaultFinalThumbBorderColor;
    _initialThumbBackgroundColor = AHSwitchControlDefaultInitialThumbBackgroundColor;
    _finalThumbBackgroundColor = AHSwitchControlDefaultFinalThumbBackgroundColor;
    _initialThumbTintColor = AHSwitchControlDefaultInitialThumbTintColor;
    _finalThumbTintColor = AHSwitchControlDefaultFinalThumbTintColor;
    _initialThumbCircleRadius = kAHSwitchControlDefaultInitialThumbCircleRadius;
    _finalThumbCircleRadius = kAHSwitchControlDefaultFinalThumbCircleRadius;
    
    _switchHeight = kAHSwitchControlDefaultSwitchHeight;
    _switchWidth = kAHSwitchControlDefaultSwitchWidth;
    _inset = kAHSwitchControlDefaultInset;
    _initialThumbBorderWidth = kAHSwitchControlDefaultInitialThumbBorderWidth;
    _finalThumbBorderWidth = kAHSwitchControlDefaultFinalThumbBorderWidth;
    _thumbShadowRadius = kAHSwitchControlDefaultShadowRadius;
    _thumbLayerShadowColor = AHSwitchControlDefaultThumbLayerShadowColor;
    self.backgroundColor = AHSwitchControlDefaultBackgroundColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultProperties];
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupDefaultProperties];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

- (void)commonInit {
    self.backLayer = [CAShapeLayer new];
    [self.layer addSublayer:self.backLayer];
    
    self.backShadowLayer = [CAShapeLayer new];
    [self.backLayer addSublayer:self.backShadowLayer];
    
    self.maskLayer = [CAShapeLayer layer];
    
    self.thumbLayer = [CAShapeLayer layer];
    [self.backShadowLayer addSublayer:self.thumbLayer];
    
    self.thumbCenterLayer = [CAShapeLayer layer];
    [self.thumbLayer addSublayer:self.thumbCenterLayer];
    
    [self setNeedsLayout];
}

#pragma mark - UIView

- (CGSize)intrinsicContentSize {
    return  CGSizeMake(self.switchWidth, self.switchHeight);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateUIAnimated:YES];
    self.backLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

#pragma mark - Updating UI

- (void)updateUIAnimated:(BOOL)animated {
    BOOL isOn = self.isOn;
    
    CGRect contentRect = CGRectZero;
    contentRect.size = [self intrinsicContentSize];
    
    UIColor *backgroundColor = isOn ? self.finalBackgroundColor : self.initialBackgroundColor;
    UIColor *thumbTintColor = isOn ? self.finalThumbTintColor : self.initialThumbTintColor;
    UIColor *thumbBorderColor = isOn ? self.finalThumbBorderColor : self.initialThumbBorderColor;
    UIColor *thumbBackgroundColor = isOn ? self.finalThumbBackgroundColor : self.initialThumbBackgroundColor;
    CGFloat thumbCircleRadius =  isOn ? self.finalThumbCircleRadius : self.initialThumbCircleRadius;
    CGFloat thumbBorderWidth = isOn ? self.finalThumbBorderWidth : self.initialThumbBorderWidth;
    CGPoint thumbLayerPosition = isOn ? CGPointMake(contentRect.size.width - contentRect.size.height, 0) :
    CGPointMake(0, 0);
    CGPoint maskLayerPosition = thumbLayerPosition;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(self.inset, self.inset, self.inset, self.inset);
    CGRect backLayerFrame = UIEdgeInsetsInsetRect(contentRect, insets);
    self.backLayer.path = [UIBezierPath bezierPathWithRoundedRect:backLayerFrame cornerRadius:CGRectGetMidY(backLayerFrame)].CGPath;
    self.backLayer.bounds = contentRect;
    self.backLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    
    self.backShadowLayer.path = [UIBezierPath bezierPathWithRoundedRect:backLayerFrame cornerRadius:CGRectGetMidY(backLayerFrame)].CGPath;
    self.backShadowLayer.mask = self.maskLayer;
    
    CGRect thumbFrame = CGRectMake(thumbBorderWidth, thumbBorderWidth, contentRect.size.height - 2 * thumbBorderWidth, contentRect.size.height - 2 * thumbBorderWidth);
    UIBezierPath *thumbLayerPath = [UIBezierPath bezierPathWithOvalInRect:thumbFrame];
    self.thumbLayer.path = thumbLayerPath.CGPath;
    
    self.thumbLayer.shadowOffset = CGSizeMake(1, 1);
    self.thumbLayer.shadowRadius = self.thumbShadowRadius;
    self.thumbLayer.shadowOpacity = 0.4f;
    self.thumbLayer.shadowColor = self.thumbLayerShadowColor.CGColor;
    self.thumbLayer.shadowPath = [UIBezierPath bezierPathWithOvalInRect:thumbFrame].CGPath;
    
    [CATransaction begin];
    
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setDisableActions:!animated];
    
    self.thumbLayer.position = thumbLayerPosition;
    self.maskLayer.position = maskLayerPosition;
    
    CGFloat thumbCenterLayerInset = (thumbFrame.size.height - thumbCircleRadius) / 2;
    UIEdgeInsets thumbCenterLayerInsetInsets = UIEdgeInsetsMake(thumbCenterLayerInset, thumbCenterLayerInset, thumbCenterLayerInset, thumbCenterLayerInset);
    
    UIBezierPath *toThumbCenterLayerPath = (id)[UIBezierPath bezierPathWithOvalInRect:UIEdgeInsetsInsetRect(thumbFrame, thumbCenterLayerInsetInsets)];
    
    CABasicAnimation *thumbCenterLayerPathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    thumbCenterLayerPathAnimation.fromValue = (id)self.thumbCenterLayer.path;
    thumbCenterLayerPathAnimation.toValue = (id)toThumbCenterLayerPath.CGPath;
    
    [self.thumbCenterLayer addAnimation:thumbCenterLayerPathAnimation forKey:@"path"];
    self.thumbCenterLayer.path = toThumbCenterLayerPath.CGPath;
    
    UIEdgeInsets maskLayerInsets = UIEdgeInsetsMake(-thumbBorderWidth, -thumbBorderWidth, -thumbBorderWidth, -thumbBorderWidth);
    UIBezierPath *toPathMaskLayer = (id)[UIBezierPath bezierPathWithOvalInRect:UIEdgeInsetsInsetRect(thumbFrame, maskLayerInsets)];
    
    CABasicAnimation *pathAnimationMaskLayer = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimationMaskLayer.fromValue = (id)self.maskLayer.path;
    pathAnimationMaskLayer.toValue = (id)toPathMaskLayer.CGPath;
    
    [self.maskLayer addAnimation:pathAnimationMaskLayer forKey:@"path"];
    self.maskLayer.path = toPathMaskLayer.CGPath;
    
    self.backLayer.fillColor = backgroundColor.CGColor;
    self.backShadowLayer.fillColor = thumbBorderColor.CGColor;
    self.thumbLayer.fillColor = thumbBackgroundColor.CGColor;
    self.thumbCenterLayer.fillColor = thumbTintColor.CGColor;
    
    [CATransaction commit];
}

#pragma mark - Handle Touches

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
    
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchPoint)) {
        self.on = !self.isOn;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
