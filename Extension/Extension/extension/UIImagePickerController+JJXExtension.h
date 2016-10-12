//
//  UIImagePickerController+JJXExtension.h
//  git
//
//  Created by 贾 on 16/9/30.
//  Copyright © 2016年 贾. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImagePickerCompleteBlock)(UIImagePickerController *picker, NSDictionary *info);
typedef void(^ImagePickerCancelBlock)(UIImagePickerController *picker);

@interface UIImagePickerController (JJXExtension)<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (void)showToViewController:(UIViewController *)controller
               completeBlock:(ImagePickerCompleteBlock)completeBlcok
                 cancelBlock:(ImagePickerCancelBlock)cancelBlock;

@end
