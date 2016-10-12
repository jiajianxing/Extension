#Extension
      常用类的扩展
=================================
     手势block
#用法
[self.view addGestureRecognizer:[UITapGestureRecognizer JJX_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {

NSLog(@"执行点击手势操作");
}]];

#相机,相册使用block

UIImagePickerController *picker = [[UIImagePickerController alloc] init];
picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
[picker showToViewController:self completeBlock:^(UIImagePickerController *picker, NSDictionary *info) {
NSLog(@"选择照片或者照相后回调");
[picker dismissViewControllerAnimated:YES completion:nil];
} cancelBlock:^(UIImagePickerController *picker) {
[picker dismissViewControllerAnimated:YES completion:nil];

}];

#UIAlertController block
