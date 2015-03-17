//
//  RootViewController.m
//  customcellslidetest
//
//  Created by macbook on 2015/03/17.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

/*
 サムネイル・デバイス名・セル番号で構成されたカスタムセルのID
 "XibCustomCell.xib"ファイルとの紐付け
 */
static NSString * const TableViewCustomCellIdentifier = @"XibCustomCell";

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // テーブルに表示したい配列を用意
    _iphoneModels = [NSMutableArray arrayWithObjects:@"iPhone 4", @"iPhone 4S", @"iPhone 5", @"iPhone 5c", @"iPhone 5s", @"iPhone 6c", @"iPhone 6 plus", nil];
    
    // カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];
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

// 左スワイプ時の動作
// UITableViewDelegateに追加された編集・削除メソッドiOS8から
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 削除ボタン
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"del" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 削除ボタンの処理はここ
        NSLog(@"Delete:%@", indexPath);
        // 削除処理
        // 配列本体のデータ削除
        NSInteger row = [indexPath row];
        [_iphoneModels removeObjectAtIndex:row];
        // 表示上のセル削除
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    // 編集ボタン
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 編集ボタンの処理はここ
        NSLog(@"Edit:%@", indexPath);
    }];
    
    // ボタンの数はここのreturnで決まる
    return @[deleteAction, editAction];
}

// iOS7で必須。iOS8では不要。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"commitEditingStyle called");
    // 削除の場合
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 削除処理
        // 配列本体のデータ削除
        NSInteger row = [indexPath row];
        [_iphoneModels removeObjectAtIndex:row];
        // 表示上のセル削除
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    // 挿入の場合
    if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

// 右スワイプ時の動作定義
- (IBAction)swipedRight:(id)sender {
    // スワイプした位置（座標点）を取得します。
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
