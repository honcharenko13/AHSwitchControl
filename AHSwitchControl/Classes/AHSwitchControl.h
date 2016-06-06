//
//  AHSwitchControl.h
//  Pods
//
//  Created by Aleksandr on 06.06.16.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface AHSwitchControl : UIControl

/**
 * The flag that indicates the current state of control. Default is NO.
 **/
@property (assign, nonatomic, getter = isOn) IBInspectable BOOL on;

/**
 * The background color of control if property "on" is NO.
 **/
@property (strong, nonatomic) IBInspectable UIColor *initialBackgroundColor                     UI_APPEARANCE_SELECTOR;
/**
 * The background color of control if property "on" is YES.
 **/
@property (strong, nonatomic) IBInspectable UIColor *finalBackgroundColor                       UI_APPEARANCE_SELECTOR;
/**
 * The tint color of thumb if property "on" is NO.
 **/
@property (strong, nonatomic) IBInspectable UIColor *initialThumbTintColor                      UI_APPEARANCE_SELECTOR;
/**
 * The tint color of thumb if property "on" is YES.
 **/
@property (strong, nonatomic) IBInspectable UIColor *finalThumbTintColor                        UI_APPEARANCE_SELECTOR;
/**
 * The border color of thumb if property "on" is NO.
 **/
@property (strong, nonatomic) IBInspectable UIColor *initialThumbBorderColor                    UI_APPEARANCE_SELECTOR;
/**
 * The border color of thumb if property "on" is YES.
 **/
@property (strong, nonatomic) IBInspectable UIColor *finalThumbBorderColor                      UI_APPEARANCE_SELECTOR;
/**
 * The border radius of thumb if property "on" is NO.
 **/
@property (assign, nonatomic) IBInspectable CGFloat initialThumbCircleRadius;
/**
 * The border radius of thumb if property "on" is YES.
 **/
@property (assign, nonatomic) IBInspectable CGFloat finalThumbCircleRadius;
/**
 * The background color of thumb if property "on" is NO.
 **/
@property (strong, nonatomic) IBInspectable UIColor *initialThumbBackgroundColor                UI_APPEARANCE_SELECTOR;
/**
 * The background color of thumb if property "on" is YES.
 **/
@property (strong, nonatomic) IBInspectable UIColor *finalThumbBackgroundColor                  UI_APPEARANCE_SELECTOR;

/**
 * The width of control. Control can't be bigger than this value.
 **/
@property (assign, nonatomic) IBInspectable CGFloat switchWidth;
/**
 * The height of control. Control can't be bigger than this value.
 **/
@property (assign, nonatomic) IBInspectable CGFloat switchHeight;

/**
 * The width border of thumb if property "on" is NO.
 **/
@property (nonatomic) IBInspectable CGFloat initialThumbBorderWidth;
/**
 * The width border of thumb if property "on" is YES.
 **/
@property (nonatomic) IBInspectable CGFloat finalThumbBorderWidth;

/**
 * The inset of control. This parameter allows to change  top, left, bottom and right sides of control
 together that is squeezes body of control from all sides.
 **/
@property (nonatomic) IBInspectable CGFloat inset;
/**
 * The shadow radius of thumb.
 **/
@property (nonatomic) IBInspectable CGFloat thumbShadowRadius;
/**
 * The shadow color of thumb.
 **/
@property (strong, nonatomic) IBInspectable UIColor *thumbLayerShadowColor                      UI_APPEARANCE_SELECTOR;

@end
