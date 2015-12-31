//
//  XHActionSheet.h
//  XHActionSheet
//
//  Created by chengxianghe on 15/12/31.
//  Copyright © 2015年 CXH. All rights reserved.
//

/**
 *  XHActionSheet
 *
 *  cancelTitle 默认 index = 0
 *
 */

#import <UIKit/UIKit.h>
@class XHActionSheet;

typedef void(^XHActionSheetClick)(NSInteger clickIndex);
typedef void(^XHActionSheetCustom)(XHActionSheet *actionSheet);
typedef void(^XHActionSheetCancel)();

@interface XHActionSheet : UIView

/**
 *  快速创建并展示一个XHActionSheet
 *
 *  @param view        指定的父view, 默认为 keyWindow
 *  @param title       标题
 *  @param cancelTitle 取消按钮标题 下标0
 *  @param otherTitles 最上面是下标1,依次向下递增
 *  @param custom      定制部分UI
 *  @param clickIndex  点击Item的block
 *  @param cancel      点击背景消失的block
 *
 *  @return XHActionSheet
 */
+ (instancetype)showInView:(UIView *)view
                     title:(NSString *)title
               cancelTitle:(NSString *)cancelTitle
               otherTitles:(NSArray *)otherTitles
                    custom:(XHActionSheetCustom)custom
                clickIndex:(XHActionSheetClick)clickIndex
                    cancel:(XHActionSheetCancel)cancel;


/**
 *  创建ActionSheet (调用show才会显示)
 *
 *  @param title       标题
 *  @param cancelTitle 取消按钮标题 下标0
 *  @param otherTitles 最上面是下标1,依次向下递增
 *
 *  @return XHActionSheet
 */
- (instancetype)initWithTitle:(NSString *)title
                  cancelTitle:(NSString *)cancelTitle
                  otherTitles:(NSArray *)otherTitles;

/**
 *  改变ActionSheet的标题
 */
- (void)changeActionSheetTitle:(NSString *)title;

/**
 *  改变指定下标的字体颜色
 */
- (void)changeItemTitleColor:(UIColor *)color
                   withIndex:(NSInteger)index;

/**
 *  改变指定下标的标题
 */
- (void)changeItemTitle:(NSString *)title
              withIndex:(NSInteger)index;

/**
 *  展示
 *
 *  @param view         指定的父view, 默认为 keyWindow
 *  @param clickIndex   点击Item的block
 *  @param cancel       点击背景消失的block
 */
- (void)showInView:(UIView *)view
        clickIndex:(XHActionSheetClick)clickIndex
            cancel:(XHActionSheetCancel)cancel;
@end
