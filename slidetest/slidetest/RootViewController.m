//
//  RootViewController.m
//  slidetest
//
//  Created by macbook on 2015/03/14.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

/*
 サムネイル・デバイス名・セル番号で構成されたカスタムセルのID
 "TableViewCustomCell.xib"ファイルとの紐付け
 */
static NSString * const TableViewCustomCellIdentifier = @"TableViewCustomCell";

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // デリゲートメソッドをこのクラスで実装する
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // テーブルに表示したいデータソースをセット
    _iphoneModels = @[@"iPhone 4", @"iPhone 4S", @"iPhone 5", @"iPhone 5c", @"iPhone 5s"];
    
    // カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    //[self.searchDisplayController.searchResultsTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger dataCount;
    // テーブルに表示するデータ件数を返す
            dataCount = _iphoneModels.count;
    return dataCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.labelDate.text = _iphoneModels[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomTableViewCell rowHeight];
}

- (IBAction)swipedRight:(id)sender {
    // タップした位置（座標点）を取得します。
    CGPoint pos = [sender locationInView:self.tableView];
    // 座標点から、tableViewのメソッドを使って、NSIndexPathを取得します。
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:pos];
    // 個別セルがあるかどうかの判定
    if(swipedIndexPath){
        // スワイプしたセルにデータがある場合
        NSLog(@"スワイプセルrow:%ld", swipedIndexPath.row);
    }else{
        // スワイプしたセルが空の場合
        NSLog(@"スワイプ無効");
    }
}
@end
