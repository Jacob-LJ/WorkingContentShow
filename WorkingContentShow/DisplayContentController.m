//
//  DisplayContentController.m
//  WorkingContentShow
//
//  Created by Jacob_Liang on 2017/9/7.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "DisplayContentController.h"
//model
#import "ImageModel.h"
//categroy
#import "UIImage+GIF.h"

@interface DisplayContentController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;


@end

@implementation DisplayContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    [self setUpImageView];
    
}

- (void)setUpNav {
    self.navigationItem.title = self.model.sectionName;
}

- (void)setUpImageView {
    
    if ([self.model.url containsString:@"gif"]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.model.url.lastPathComponent ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        UIImage *image = [UIImage sd_animatedGIFWithData:data];
        
        self.imageV.image = image;
        self.imageV.animationImages = image.images;
        self.imageV.animationDuration = image.duration;
        self.imageV.animationRepeatCount = 0;
        self.imageV.image = image.images[image.images.count / 2];
        [self.imageV startAnimating];
        
    } else {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:self.model.url.lastPathComponent ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        UIImage *image = [[UIImage alloc]initWithData:data];
        //        CGFloat scale = (WISettingPlayGIFCCellWH - 15) / image.size.width;
        //        image = [image hlm_scaleTo:scale];
        self.imageV.image = image;
        
    }
}

@end
