//
//  IKNavBarItem.m
//  NavBarClassDemo
//
//  Created by jiejin on 15/5/12.
//  Copyright (c) 2015年 jiejin. All rights reserved.
//

#import "IKNavBarItem.h"

#define Default_Offset 10
#define TitleViewSize CGSizeMake(70, 30)//用NSString设置item时 item的尺寸
@implementation IKNavBarItem

// 自定义的初始化方法
- (void)initCustomItemWithType:(ItemLocationType)type
                       andSize:(CGSize)size
{
    self.isCustomView = NO;
    self.itemLocationType = type;
    self.items = [[NSMutableArray alloc] init];
    self.contentBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
    [self.items addObject:self.contentBarItem];
}

// 初始化自定义文字barbtn
+ (IKNavBarItem *)itemWithTitle:(NSString *)title
                      textColor:(UIColor *)color
                       fontSize:(CGFloat )font
                       itemType:(ItemLocationType)type
{
    IKNavBarItem *item = [[IKNavBarItem alloc] init];
    [item initCustomItemWithType:type andSize:TitleViewSize];
    [item setItemContetnWithType:type];
    [item.contentBarItem setTitle:title forState:(UIControlStateNormal)];
    [item.contentBarItem setTitleColor:color forState:(UIControlStateNormal)];
    [item.contentBarItem.titleLabel setFont:[UIFont systemFontOfSize:font]];
    return item;
}

// 初始化自定义图片barbtn
+ (IKNavBarItem *)itemWithImage:(NSString *)imageName
                 highLightImage:(NSString *)hlImageName
                           size:(CGSize)size
                           type:(ItemLocationType)type
{
    IKNavBarItem *item = [[IKNavBarItem alloc] init];
    [item initCustomItemWithType:type andSize:size];
    [item setItemContetnWithType:type];
    [item.contentBarItem setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    
    if(hlImageName.length != 0){
    
        [item.contentBarItem setImage:[UIImage imageNamed:hlImageName] forState:(UIControlStateHighlighted)];
    }
    
    return item;
}

// 初始化自定义view的barbtn
+ (IKNavBarItem *)itemWithCustomeView:(UIView *)customView
                                 type:(ItemLocationType)type
{
    IKNavBarItem *item = [[IKNavBarItem alloc] init];
    [item initCustomItemWithType:type andSize:customView.frame.size];
    item.isCustomView = YES;
    item.customView = customView;
    customView.frame = item.contentBarItem.bounds;
    [item.contentBarItem addSubview:customView];
    [item setItemContetnWithType:type];
    
    return item;
}

- (void)setItemContetnWithType:(ItemLocationType)type
{
    if (type == ItemAtNavigationBarRight) {
        
        [self.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [self changeItemHorizontalDirectionWithChangeValue:Default_Offset];
    }
    else if (type == ItemAtNavigationBarLeft){
        
        [self.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self changeItemHorizontalDirectionWithChangeValue:-Default_Offset];
    }
}

// 设置barbtn的横向偏移量
- (void)changeItemHorizontalDirectionWithChangeValue:(CGFloat)changeValue;
{
    if (self.isCustomView) {
        
        CGRect customViewFrame = self.customView.frame;
        customViewFrame.origin.x = changeValue;
        self.customView.frame = customViewFrame;
    }
    else{
        
        [self.contentBarItem setContentEdgeInsets:UIEdgeInsetsMake(0, changeValue, 0, -changeValue)];
    }
}

// 给初始化后的barbtn添加事件
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event
{
    [self.contentBarItem addTarget:target action:selector forControlEvents:event];
}

// 将初始化后的barbtn添加在相应的uinavigationitem上
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemLocationType)type
{
    if (type == ItemAtNavigationBarCenter) {
        
        [navigationItem setTitleView:self.contentBarItem];
    }
    else if (type == ItemAtNavigationBarLeft){
        
        [navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem]];
    }
    else if (type == ItemAtNavigationBarRight){
        
        [navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem]];
    }
}

@end
