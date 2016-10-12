//
//  UIImagePickerController+JJXExtension.m
//  git
//
//  Created by 贾 on 16/9/30.
//  Copyright © 2016年 贾. All rights reserved.
//

#import "UIImagePickerController+JJXExtension.h"
#import <objc/message.h>

static char imagePickerCompleteBlockKey;
static char imagePickerCancelBlockKey;

@implementation UIImagePickerController (JJXExtension)

- (void)showToViewController:(UIViewController *)controller completeBlock:(ImagePickerCompleteBlock)completeBlcok cancelBlock:(ImagePickerCancelBlock)cancelBlock
{
    if (completeBlcok) {
        objc_setAssociatedObject(self, &imagePickerCompleteBlockKey, completeBlcok, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    if (cancelBlock) {
        objc_setAssociatedObject(self, &imagePickerCancelBlockKey, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    self.delegate = self;
    [controller presentViewController:self animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    ImagePickerCompleteBlock block = objc_getAssociatedObject(self, &imagePickerCompleteBlockKey);
    if (block) {
        block(picker, info);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    ImagePickerCancelBlock block = objc_getAssociatedObject(self, &imagePickerCancelBlockKey);
    if (block) {
        block(picker);
    }
}




@end
