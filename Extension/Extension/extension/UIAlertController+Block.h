//
//  UIAlertController+Block.h
//  git
//
//  Created by 贾 on 16/10/8.
//  Copyright © 2016年 贾. All rights reserved.
//

#import <UIKit/UIKit.h>

#if TARGET_OS_IOS

typedef void(^UIAlertControllerPopoverPresentationControllerBlcok)(UIPopoverPresentationController  *__nonnull popover);

#endif

typedef void(^UIAlertControllerCompletionBlock)(UIAlertController *__nonnull controller, UIAlertAction *__nonnull action, NSInteger index);


@interface UIAlertController (Block)

+ (nullable instancetype)showInViewController:(nonnull UIViewController *)controller
                           withTitle:(nullable NSString *)title
                             message:(nullable NSString *)message
                      preferredStyle:(UIAlertControllerStyle)preferredStyle
                   cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                       destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                            otherButtonTitles:(nullable NSArray *)otherButtonTitles
#if TARGET_OS_IOS

           popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlcok)popoverPresentationControllerBlock
#endif
                                     tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;



+ (nullable instancetype)showAlertInViewController:(nonnull UIViewController *)controller
                                         WithTitle:(nullable NSString *)title
                                           message:(nullable NSString *)message
                                 cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                            destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                 otherButtonTitles:(nullable NSArray *)otherButtonTitles
                                          tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;


+ (nullable instancetype)showActionSheetInViewController:(nonnull UIViewController *)controller
                                               withTitle:(nullable NSString *)title
                                                 message:(nullable NSString *)message
                                          preferredStyle:(UIAlertControllerStyle)preferredStyle
                                       cancelButtonTitle:(nullable NSString *)cancelButtonTitle
                                  destructiveButtonTitle:(nullable NSString *)destructiveButtonTitle
                                       otherButtonTitles:(nullable NSArray *)otherButtonTitles
#if TARGET_OS_IOS

                      popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlcok)popoverPresentationControllerBlock
#endif
                                                tapBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;


@end
