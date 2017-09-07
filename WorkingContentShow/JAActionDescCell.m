//
//  JAActionDescCell.m
//  WorkingContentShow
//
//  Created by Jacob_Liang on 2017/9/7.
//  Copyright © 2017年 Jacob. All rights reserved.
//

#import "JAActionDescCell.h"

@implementation JAActionDescCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpInit];
}

- (void)setUpInit {
    self.contentView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textLabel.font = [UIFont systemFontOfSize:13];
}

- (void)setModel:(ImageModel *)model {
    _model = model;
    self.textLabel.text = model.sectionName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


