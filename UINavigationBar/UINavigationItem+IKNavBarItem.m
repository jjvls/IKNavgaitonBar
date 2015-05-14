//
//  UINavigationItem+IKNavBarItem.m
//  NavBarClassDemo
//
//  Created by jiejin on 15/5/12.
//  Copyright (c) 2015年 jiejin. All rights reserved.
//

#import "UINavigationItem+IKNavBarItem.h"

#define navBarBtnWidth 52
#define navBarBtnHeight 44


@implementation UINavigationItem (IKNavBarItem)

// 自定义初始化customBtn方法
- (id)createCostomBtnWithColor:(UIColor *)color andFont:(UIFont *)font{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, navBarBtnWidth, navBarBtnHeight)];
    
    if(color != nil){
        
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    
    if(font != nil){
        
        button.titleLabel.font = font;
    }
    
    return button;
}


// 左按钮无图片方法
- (void)setLeftBarButtonWithTarget:(id)target
                            action:(SEL)action
                             title:(NSString *)title
                        titleColor:(UIColor *)color
                         titleFont:(UIFont *)font{
    
    UIButton *leftBtn = [self createCostomBtnWithColor:color andFont:font];
    
    if(title.length == 0){
        
        [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    }else{
        
        [leftBtn setTitle:title forState:UIControlStateNormal];
    }
    
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

// 左按钮有图片方法
- (void)setLeftBarButtonWithTarget:(id)target
                            action:(SEL)action
                       normalImage:(UIImage *)nImage
                    highlightImage:(UIImage *)hImage
                             title:(NSString *)title
                        titleColor:(UIColor *)color
                         titleFont:(UIFont *)font{
    
    UIButton *leftBtn = [self createCostomBtnWithColor:color andFont:font];
    [leftBtn setBackgroundImage:nImage forState:UIControlStateNormal];
    
    if(hImage != nil){
        
        [leftBtn setBackgroundImage:hImage forState:UIControlStateHighlighted];
    }
    
    if(title.length != 0){
        
        [leftBtn setTitle:title forState:UIControlStateNormal];
    }
    
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

// 设置向右偏移量较大的左按钮
- (void)setLeftBarButtonWithTarget:(id)target
                            action:(SEL)action
                       normalImage:(UIImage *)nImage
                    highlightImage:(UIImage *)hImage
                       changeValue:(CGFloat)value{

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(0, 0, (value - 10), 30)];
    [btn1 setBackgroundColor:[UIColor clearColor]];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    
    UIButton *leftBtn = [self createCostomBtnWithColor:nil andFont:nil];
    
    [leftBtn setBackgroundImage:nImage forState:UIControlStateNormal];
    
    if(hImage != nil){
        [leftBtn setBackgroundImage:hImage forState:UIControlStateHighlighted];
    }
    
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.leftBarButtonItems = @[item1, item2];
}

// 右按钮无图片方法
- (void)setRightBarButtonWithTarget:(id)target
                             action:(SEL)action
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                          titleFont:(UIFont *)font{
    
    UIButton *rightBtn = [self createCostomBtnWithColor:color andFont:font];
    
    if(title.length == 0){
        
        [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    }else{
        
        [rightBtn setTitle:title forState:UIControlStateNormal];
    }
    
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

// 右按钮有图片方法
- (void)setRightBarButtonWithTarget:(id)target
                             action:(SEL)action
                        normalImage:(UIImage *)nImage
                     highlightImage:(UIImage *)hImage
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                          titleFont:(UIFont *)font{
    
    UIButton *rightBtn = [self createCostomBtnWithColor:color andFont:font];
    [rightBtn setBackgroundImage:nImage forState:UIControlStateNormal];
    
    if(hImage != nil){
        [rightBtn setBackgroundImage:hImage forState:UIControlStateHighlighted];
    }
    
    if(title.length != 0){
        
        [rightBtn setTitle:title forState:UIControlStateNormal];
    }
    
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

// 设置向左偏移量较大的右按钮
- (void)setRightBarButtonWithTarget:(id)target
                            action:(SEL)action
                       normalImage:(UIImage *)nImage
                    highlightImage:(UIImage *)hImage
                       changeValue:(CGFloat)value{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(0, 0, (value - 10), 30)];
    [btn1 setBackgroundColor:[UIColor clearColor]];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    
    UIButton *rightBtn = [self createCostomBtnWithColor:nil andFont:nil];
    
    [rightBtn setBackgroundImage:nImage forState:UIControlStateNormal];
    
    if(hImage != nil){
        [rightBtn setBackgroundImage:hImage forState:UIControlStateHighlighted];
    }
    
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.leftBarButtonItems = @[item1, item2];
}

// 设置可微调位置文字按钮
- (IKNavBarItem *)setItemWithTitle:(NSString *)title
                         textColor:(UIColor *)color
                          fontSize:(CGFloat)font itemType:(ItemLocationType)type
{
    IKNavBarItem *item = [IKNavBarItem itemWithTitle:title textColor:color fontSize:font itemType:type];
    [item setItemWithNavigationItem:self itemType:type];
    
    return item;
}

// 设置可微调位置图片按钮
- (IKNavBarItem *)setItemWithImage:(NSString *)imageName
                    highLightImage:(NSString *)hlImageName
                              size:(CGSize)size
                          itemType:(ItemLocationType)type
{
    IKNavBarItem *item = [IKNavBarItem itemWithImage:imageName highLightImage:hlImageName size:size type:type];
    [item setItemWithNavigationItem:self itemType:type];
    
    return item;
}

// 设置可微调位置视图（view）按钮
- (IKNavBarItem *)setItemWithCustomView:(UIView *)customView
                               itemType:(ItemLocationType)type
{
    IKNavBarItem *item = [IKNavBarItem itemWithCustomeView:customView type:type];
    [item setItemWithNavigationItem:self itemType:type];
    
    return item;
}



@end
