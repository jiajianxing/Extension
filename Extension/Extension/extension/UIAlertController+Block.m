//
//  UIAlertController+Block.m
//  git
//
//  Created by 贾 on 16/10/8.
//  Copyright © 2016年 贾. All rights reserved.
//

#import "UIAlertController+Block.h"

static NSInteger const UIAlertControllerBlocksCancelButtonIndex = 0;
static NSInteger const UIAlertControllerBlocksDestructiveButtonIndex = 1;
static NSInteger const UIAlertControllerBlocksFirstOtherButtonIndex = 2;


@implementation UIAlertController (Block)


+ (instancetype)showInViewController:(UIViewController *)controller withTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
#if TARGET_OS_IOS
  popoverPresentationControllerBlock:(UIAlertControllerPopoverPresentationControllerBlcok)popoverPresentationControllerBlock
#endif
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    
    UIAlertController *defineController = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    __weak typeof(defineController) weakController = defineController;
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(weakController, action, UIAlertControllerBlocksCancelButtonIndex);
            }
        }];
        [defineController addAction:cancelAction];
        
    }
    
    if (destructiveButtonTitle) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(weakController, action, UIAlertControllerBlocksDestructiveButtonIndex);

            }
            
        }];
        
        [defineController addAction:destructiveAction];
    }
     [otherButtonTitles enumerateObjectsUsingBlock:^(NSString *otherTitle, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(weakController, action, UIAlertControllerBlocksFirstOtherButtonIndex + idx);
            }
        }];
        
        [defineController addAction:otherAction];
    }];
    
#if TARGET_OS_IOS
    if (popoverPresentationControllerBlock) {
        popoverPresentationControllerBlock(controller.popoverPresentationController);
    }
    
#endif
    
    [controller presentViewController:defineController animated:YES completion:nil];
    
    return defineController;
}

+ (instancetype)showAlertInViewController:(UIViewController *)controller WithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    
    return [self showInViewController:controller withTitle:title message:message preferredStyle:UIAlertControllerStyleAlert cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:otherButtonTitles popoverPresentationControllerBlock:nil tapBlock:tapBlock];
    
}


+ (instancetype)showActionSheetInViewController:(UIViewController *)controller withTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
#if TARGET_OS_IOS
             popoverPresentationControllerBlock:(UIAlertControllerPopoverPresentationControllerBlcok)popoverPresentationControllerBlock
#endif
                                       tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    return [self showInViewController:controller withTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle
      otherButtonTitles:otherButtonTitles
#if TARGET_OS_IOS
    popoverPresentationControllerBlock:popoverPresentationControllerBlock
#endif
                        tapBlock:tapBlock];
}






@end
