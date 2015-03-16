//
//  CustomTableViewCell.h
//  slidetest
//
//  Created by macbook on 2015/03/15.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSummary;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

// クラスメソッド宣言
+ (CGFloat)rowHeight;

@end
