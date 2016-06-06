# **AHSwitchControl** 


The control that has similar behaviour as UISwitch. The control allows to set its width and height, colors of its all parts. The control has two states: Off and On, and allows to set required color or value depending on state. Property "inset" allows to change  top, left, bottom and right sides of control together that is squeezes body of control from all sides. The control has border that is attribute from UISwitch. When property "inset" is bigger than 0 outer part of border is hided.

The colors of control also supports UIAppearance. You can globally setup all colors appeareance and then anytime you create an instance it will already be styled.

You can see image below that shows properties of AHSwitchControl class.  Sizes are painted in circles, colors - in squares:

```objective-c
1. @property (assign, nonatomic) CGFloat switchHeight;
2. @property (assign, nonatomic) CGFloat switchWidth;
3. @property (assign, nonatomic) CGFloat initialThumbCircleRadius;
or 
@property (assign, nonatomic) CGFloat finalThumbCircleRadius; 
(depend on state)
4. @property (assign, nonatomic) CGFloat initialThumbBorderWidth;
or 
@property (assign, nonatomic) CGFloat finalThumbBorderWidth; 
(depend on state)
5. @property (nonatomic) CGFloat inset;
6. @property (strong, nonatomic) UIColor *initialBackgroundColor;
or 
@property (strong, nonatomic) UIColor *finalBackgroundColor; 
(depend on state)
7. @property (strong, nonatomic) UIColor *initialThumbBackgroundColor;
or 
@property (strong, nonatomic) UIColor *finalThumbBackgroundColor; 
(depend on state)
8. @property (strong, nonatomic) UIColor *initialThumbTintColor;
or 
@property (strong, nonatomic) UIColor *finalThumbTintColor; 
(depend on state)
9. @property (strong, nonatomic) UIColor *initialThumbBorderColor;
or 
@property (strong, nonatomic) UIColor *finalThumbBorderColor; 
(depend on state)
```


![enter image description here](http://i1043.photobucket.com/albums/b436/honcharenko-cr/CRSwitchControl_zpsgkc0yak4.png)


## **Example**
To run the example project, clone the repo, and run `pod install` from the Example directory first.

![enter image description here](http://i.giphy.com/jT1gJkQxXFr5m.gif)

## **Requirements**

- iOS 8.0+

## **Installation**
####**Manually**

Add the AHSwitchControl as a submodule to your project or download the code from the master branch here.

Simply add the AHSwitchControl.h + AHSwitchControl.m files in the AHSwitchControl folder to your Xcode project. Then #include "AHSwitchControl.h" in your source files where you want to use the AHSwitchControl.  
```objective-c
#import <AHSwitchControl/AHSwitchControl.h>
```

## **Usage**
The AHSwitchControl is easy to use.  AHSwitchControl is subclass of UIControl,  so you can select and drag UIView from Object Library then open Identity Inspector of this object and select AHSwitchControl in "Class" field.  You can change properties of control at Attributes Inspector.  

Or you can create instance of AHSwitchControl class in code:
```objective-c
AHSwitchControl *switchControl = [[AHSwitchControl alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
[self.view addSubview:switchControl];
```


## **Support**
If you have any questions, please contact me for support at pfca13@gmail.com (email subject:«AHSwitchControl support»)

## **License**

AHSwitchControl is available under the MIT license. See the LICENSE file for more info.

