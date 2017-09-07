//
//  JAActionDescCell.h
//  WorkingContentShow
//
//  Created by Jacob_Liang on 2017/9/7.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImageModel.h"

static NSString * const JAActionDescCellID = @"JAActionDescCell";

@interface JAActionDescCell : UITableViewCell

@property (nonatomic, strong) ImageModel *model;

@end
