//
//  ViewController.m
//  WorkingContentShow
//
//  Created by Jacob_Liang on 2017/9/7.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "ViewController.h"
//vc
#import "DisplayContentController.h"
//view
#import "JAActionDescCell.h"
//model
#import "ImageModel.h"
//lib
#import "MJExtension.h"
#import "SVProgressHUD.h"
//other
#import <StoreKit/StoreKit.h>

static const CGFloat kDefaultCellHeight = 50;
static NSString * const HLMAPPID = @"883553069";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, SKStoreProductViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<ImageModel *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    [self setUpInit];
    
}

- (void)setUpNav {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"说明" style:UIBarButtonItemStylePlain target:self action:@selector(desc)];
}

- (void)setUpInit {
    self.dataSource = [ImageModel mj_objectArrayWithFilename:@"GifImages.plist"];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JAActionDescCell *cell = [tableView dequeueReusableCellWithIdentifier:JAActionDescCellID];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kDefaultCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DisplayContentController *displayVC = [[DisplayContentController alloc] init];
    displayVC.model = self.dataSource[indexPath.row];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController pushViewController:displayVC animated:YES];

}

#pragma mark - 说明
- (void)desc {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"这是本人部分近期工作内容的一个简单截图展示应用，方便自己整理知识点" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAct = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:NULL];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *downLoad = [UIAlertAction actionWithTitle:@"下载 婚礼猫" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //present 样式，应用内打开 Appstore
        [weakSelf openAppFromAppStore:HLMAPPID];
        
        //push 样式的 App Store应用 打开下载界面 scheme > itms-apps://
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",HLMAPPID]];
//        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:NULL];
        
        //push 样式的 App Store应用 打开下载界面 scheme > https://
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/in/app/id%@",HLMAPPID]];
//        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:NULL];
    }];
    
    [alert addAction:cancleAct];
    [alert addAction:downLoad];
    [self presentViewController:alert animated:YES completion:NULL];
}

#pragma mark - Download HLM in SKStoreProductViewController
- (void)openAppFromAppStore:(NSString *)appid {
    if (nil == appid || appid.length <= 0) {
        return;
    }
    
    //loading
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
//    // 改变导航栏的文字和图片颜色
//    [[UINavigationBar appearance] setTintColor:[UIColor greenColor]];
//    // 红色导航栏
//    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
//    [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[SKStoreProductViewController class]]];
//    
    
    SKStoreProductViewController *store = [[SKStoreProductViewController alloc] init];
    store.delegate = self;
    NSDictionary<NSString *, id> *parameters = @{SKStoreProductParameterITunesItemIdentifier: appid};
    
    [store loadProductWithParameters:parameters completionBlock:^(BOOL result, NSError *error) {
        
        // finish loading
        [SVProgressHUD dismiss];
        
        if (error) {
            
            NSLog(@"error %@ with userInfo %@", error, [error userInfo]);
            
            // 提示用户发生了错误
//             或者通过 URL 打开 AppStore App.
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/in/app/id%@",HLMAPPID]];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:NULL];
            
            
        } else {
            
            [self presentViewController:store animated:YES completion:NULL];
        }
    }];
}

/// 用户点击取消会执行该方法
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
