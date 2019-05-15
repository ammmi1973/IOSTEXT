//
//  SecondVC.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "SecondVC.h"
#import <AVFoundation/AVFoundation.h>
@interface SecondVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView  *loadimg;

}
@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self .tit .text =@"上传图片";
    self .view .backgroundColor =[UIColor orangeColor];
    UIButton *UpImgBut =[[UIButton alloc]initWithFrame:CGRectMake(50, h-safeBottom-250, w-100, 60)];
    [UpImgBut setTitle:@"上传图片" forState:0];
    [UpImgBut setTitleColor:[UIColor blackColor] forState:0];
    UpImgBut .titleLabel .font =[UIFont systemFontOfSize:16];
    UpImgBut .backgroundColor =[UIColor whiteColor];
    [self .view addSubview:UpImgBut];;
    [UpImgBut addTarget:self action:@selector(UpImgBut:) forControlEvents:UIControlEventTouchUpInside];
    
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        NSLog(@"requestAccessForMediaType");
    }];
    
    
    loadimg =[[UIImageView alloc]initWithFrame:CGRectMake(50,nav_height+50, 240, 320)];
    [self .view addSubview:loadimg];


}
-(void)UpImgBut:(id)sender
{
    UIImagePickerController *imagePickerController=[[UIImagePickerController alloc]init];
    imagePickerController.delegate=self;
    imagePickerController.allowsEditing=YES;
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"选取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                      {
                          imagePickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
                          imagePickerController.cameraDevice=UIImagePickerControllerCameraDeviceRear;
                          
                          [self presentViewController:imagePickerController animated:YES completion: nil];
                          
                      }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                      { imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                          
                          [self presentViewController:imagePickerController animated:YES completion:^{}];
                          
                          
                      }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }]];
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {

//        [self presentViewController:alert animated:YES completion:nil];
//
//    }
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info{
            UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
            [picker dismissViewControllerAnimated:YES completion:^{}];
    [self uploadImage:image];
}
-(void)uploadImage:(UIImage *)image
{
    NSData *imageData=UIImageJPEGRepresentation(image, 0.7);
    
    [[webRequest Manager]UpdataImgRequestImgaData:imageData andComplet:^(NSDictionary *seccesdic) {
        NSLog(@"这里是上传成功");
        [loadimg sd_setImageWithURL:seccesdic[@"photo"]];
    }];
}


@end
