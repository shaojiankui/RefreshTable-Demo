//
//  ViewController.m
//  RefreshTable-Demo
//
//  Created by shaojiankui on 14-9-27.
//  Copyright (c) 2014年 skyfox. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.datasource = [NSMutableArray array];
    
    [self.myTable configHeaderUsing:YES footer:YES];
    [self.myTable setPullDownLoadData:^{
        NSLog(@"PullDownLoadData");
        for (int i=0; i<20; i++) {
            [self.datasource addObject:[NSString stringWithFormat:@"%d",i]];
        }
        [self.myTable reloadData];
        [self.myTable finishReloadingData];
    }];
    [self.myTable setPullUpLoadData:^{
        NSLog(@"PullUpLoadData");
        for (int i=0; i<10; i++) {
            [self.datasource addObject:[NSString stringWithFormat:@"%d",i]];
        }
        [self.myTable reloadData];

        [self.myTable finishReloadingData];


    }];
    
    
}
-(void)appendTableWith:(NSMutableArray *)data

{
    for (int i=0;i<[data count];i++) {
        
        [self.datasource addObject:[data objectAtIndex:i]];
    }
    NSMutableArray *insertIndexPaths = [NSMutableArray arrayWithCapacity:10];
    
    for (int ind = 0; ind < [data count]; ind++) {
        NSIndexPath *newPath =  [NSIndexPath indexPathForRow:[self.datasource indexOfObject:[data objectAtIndex:ind]] inSection:0];
        
        [insertIndexPaths addObject:newPath];
    }
    
    [self.myTable insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.myTable scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.myTable scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

#pragma mark overide UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath%d",indexPath.row];
    // Configure the cell.
    
    return cell;
}

@end
