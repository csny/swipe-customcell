//
//  CustomTableViewCell.m
//  slidetest
//
//  Created by macbook on 2015/03/15.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// セルの高さのクラスメソッド
+ (CGFloat)rowHeight
{
    return 60.0f;
}
@end
