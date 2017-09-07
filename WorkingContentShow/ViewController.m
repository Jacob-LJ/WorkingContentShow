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

static const CGFloat kDefaultCellHeight = 50;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<ImageModel *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpInit];
    
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


@end
