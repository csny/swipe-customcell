//
//  RootViewController.h
//  customcellslidetest
//
//  Created by macbook on 2015/03/17.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"

@interface RootViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)swipedRight:(id)sender;
// property*iphoneModelsは手入力、インスタンス変数iphoneModelsを準備
@property NSMutableArray *iphoneModels;

@end
