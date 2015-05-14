//
//  IKNavBarItem.h
//  NavBarClassDemo
//
//  Created by jiejin on 15/5/12.
//  Copyright (c) 2015年 jiejin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 @brief 枚举自定义barbutton的位置
 */
typedef enum{
    ItemAtNavigationBarLeft,
    ItemAtNavigationBarCenter,
    ItemAtNavigationBarRight
}ItemLocationType;

@interface IKNavBarItem : NSObject

// 自定义的按钮
@property (nonatomic, strong) UIButton *contentBarItem;
// 所有定义item的集合
@property (nonatomic, strong) NSMutableArray *items;
// barbtn的位置
@property (nonatomic, assign) ItemLocationType itemLocationType;
// 自定义的view
@property (nonatomic, strong) UIView *customView;
// 是否是自定义的view
@property (nonatomic, assign) BOOL isCustomView;

/**
 @brief 初始化自定义文字barbtn
 @param title 自定义barbtn的内容
 @param color 自定义barbtn文字的颜色
 @param font 自定义barbtn文字的字体
 @param type 自定义barbtn的位置
 */
+ (IKNavBarItem *)itemWithTitle:(NSString *)title
                      textColor:(UIColor *)color
                       fontSize:(CGFloat)font
                       itemType:(ItemLocationType)type;

/**
 @brief 初始化自定义图片barbtn
 @param imageName barbtn正常状态下的图片
 @param hlImageName barbtn高亮状态下的图片
 @param size 图片barbtn的大小
 @param type barbtn的位置
 */
+ (IKNavBarItem *)itemWithImage:(NSString *)imageName
                 highLightImage:(NSString *)hlImageName
                           size:(CGSize)size
                           type:(ItemLocationType)type;

/**
 @brief 初始化自定义view的barbtn
 @param customView 自定义barbtn的view
 @param type barbtn的位置
 */
+ (IKNavBarItem *)itemWithCustomeView:(UIView *)customView
                                 type:(ItemLocationType)type;
/**
 @brief 将初始化后的barbtn添加在相应的uinavigationitem上
 @param navigationItem 被添加的对象
 @param type barbtn的位置
 */
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem
                         itemType:(ItemLocationType)type;

/**
 @brief 给初始化后的barbtn添加事件
 @param target 事件属性可返回事件的目标节点(目标对象)
 @param selector 方法
 @param event 触发barbtn的用户操作
 */
- (void)addTarget:(id)target
         selector:(SEL)selector
            event:(UIControlEvents)event;
/**
 @brief 设置barbtn的横向偏移量  注：该方法可用户barbtn的横向小距离（5～20）的偏移
 *@param changeValue 正值向左偏，负值向右偏
 */
- (void)changeItemHorizontalDirectionWithChangeValue:(CGFloat)changeValue;

@end
