//
//  RootViewController.h
//  slidetest
//
//  Created by macbook on 2015/03/14.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"

@interface RootViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
 // インスタンス変数iphoneModelsを準備
@property NSArray *iphoneModels;
- (IBAction)swipedRight:(id)sender;


@end
