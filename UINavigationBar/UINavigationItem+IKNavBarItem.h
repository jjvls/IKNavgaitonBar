//
//  UINavigationItem+IKNavBarItem.h
//  NavBarClassDemo
//
//  Created by jiejin on 15/5/12.
//  Copyright (c) 2015年 jiejin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IKNavBarItem.h"

@interface UINavigationItem (IKNavBarItem)

#pragma mark ＝＝＝＝＝＝＝＝＝＝＝＝Systematic Method==================

/**
 @brief 设置左按钮的标题和事件
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param action 方法
 @param title 左按钮的标题。 如传入nil，则默认为“返回”
 @param color 左按钮字体颜色
 @param font 左按钮字体大小
 */
- (void)setLeftBarButtonWithTarget:(id)target
                            action:(SEL)action
                             title:(NSString *)title
                        titleColor:(UIColor *)color
                         titleFont:(UIFont *)font;

/**
 @brief 设置左按钮的标题和事件
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param action 方法
 @param nImage 正常状态下的图片
 @param hImage 高亮状态下的图片，如传入nil，则默认与正常状态下相同
 @param title 左按钮的标题，如传入nil，则默认无title信息
 @param color 左按钮字体颜色
 @param font 左按钮字体大小
 */
- (void)setLeftBarButtonWithTarget:(id)target
                            action:(SEL)action
                       normalImage:(UIImage *)nImage
                    highlightImage:(UIImage *)hImage
                             title:(NSString *)title
                        titleColor:(UIColor *)color
                         titleFont:(UIFont *)font;

/**
 @brief 设置向右偏移量较大的左按钮
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param action 方法
 @param nImage 正常状态下的图片
 @param hImage 高亮状态下的图片，如传入nil，则默认与正常状态下相同
 @param value 左按钮向右偏移的长度
 */
- (void)setLeftBarButtonWithTarget:(id)target
                            action:(SEL)action
                       normalImage:(UIImage *)nImage
                    highlightImage:(UIImage *)hImage
                       changeValue:(CGFloat)value;

/**
 @brief 设置右按钮的标题和事件
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param action 方法
 @param title 右按钮的标题。 如传入nil，则默认为“完成”
 @param color 右按钮字体颜色
 @param font 右按钮字体大小
 */
- (void)setRightBarButtonWithTarget:(id)target
                             action:(SEL)action
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                          titleFont:(UIFont *)font;

/**
 @brief 设置右按钮的标题和事件
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param action 方法
 @param nImage 正常状态下的图片
 @param hImage 高亮状态下的图片，如传入nil，则默认与正常状态下相同
 @param title 右按钮的标题，如传入nil，则默认无title信息
 @param color 右按钮字体颜色
 @param font 右按钮字体大小
 */
- (void)setRightBarButtonWithTarget:(id)target
                             action:(SEL)action
                        normalImage:(UIImage *)nImage
                     highlightImage:(UIImage *)hImage
                              title:(NSString *)title
                         titleColor:(UIColor *)color
                          titleFont:(UIFont *)font;

/**
 @brief 设置向左偏移量较大的右按钮
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param action 方法
 @param nImage 正常状态下的图片
 @param hImage 高亮状态下的图片，如传入nil，则默认与正常状态下相同
 @param value 左按钮向左偏移的长度
 */
- (void)setRightBarButtonWithTarget:(id)target
                            action:(SEL)action
                       normalImage:(UIImage *)nImage
                    highlightImage:(UIImage *)hImage
                       changeValue:(CGFloat)value;


#pragma mark ＝＝＝＝＝＝＝＝＝＝＝＝Custom Method==================

/**
 @brief 设置可微调位置文字按钮
 @param title 按钮的文字内容
 @param color 按钮的文字颜色
 @param font 按钮的字体大小
 @param type 按钮的位置
 */
- (IKNavBarItem *)setItemWithTitle:(NSString *)title
                         textColor:(UIColor *)color
                          fontSize:(CGFloat)font
                          itemType:(ItemLocationType)type;

/**
 @brief 设置可微调位置图片按钮
 @param imageName 按钮正常状态下的图片名称
 @param hlImageName 按钮高亮状态下的图片名称
 @param size 图片按钮的大小
 @param type 按钮的位置
 */
- (IKNavBarItem *)setItemWithImage:(NSString *)imageName
                    highLightImage:(NSString *)hlImageName
                              size:(CGSize)size
                          itemType:(ItemLocationType)type;

/**
 @brief 设置可微调位置视图（view）按钮
 @param customView 自定义按钮的view
 @param type 按钮的位置
 */
- (IKNavBarItem *)setItemWithCustomView:(UIView *)customView
                               itemType:(ItemLocationType)type;

@end
