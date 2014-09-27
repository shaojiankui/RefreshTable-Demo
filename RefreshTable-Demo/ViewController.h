//
//  ViewController.h
//  RefreshTable-Demo
//
//  Created by shaojiankui on 14-9-27.
//  Copyright (c) 2014年 skyfox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableView.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet RefreshTableView *myTable;
@property (strong, nonatomic)  NSMutableArray *datasource;

@end
