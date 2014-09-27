//
//  RefreshTableView.h
//  RefreshTable-Demo
//
//  Created by Jakey on 14-9-27.
//  Copyright (c) 2014年 skyfox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"
#import "EGOViewCommon.h"

typedef void(^PullDownLoadBlock)(void);
typedef void(^PullUpLoadBlock)(void);
typedef void(^PullLoadBlock)(EGORefreshPos aRefreshPos);

@interface RefreshTableView : UITableView<EGORefreshTableDelegate,UIScrollViewDelegate>
{
	BOOL _reloading;
    PullDownLoadBlock _pullDownLoadBlock;
    PullUpLoadBlock _pullUpLoadBlock;
    PullLoadBlock _pullLoadBlock;
}

@property (nonatomic, retain) EGORefreshTableHeaderView *refreshHeaderView;
@property (nonatomic, retain) EGORefreshTableFooterView *refreshFooterView;

//刷新回调
-(void)setPullDownLoadData:(PullDownLoadBlock) pullDownLoadBlock;
-(void)setPullUpLoadData:(PullUpLoadBlock) pullUpLoadBlock;
-(void)setPullLoadData:(PullLoadBlock) pullLoadBlock;


- (void)configHeaderUsing:(BOOL)useHeader footer:(BOOL)useFooter;

-(void)setFooterView;
-(void)removeFooterView;
-(void)createHeaderView;
-(void)removeHeaderView;

// overide methods
-(void)beginToReloadData:(EGORefreshPos)aRefreshPos;
-(void)finishReloadingData;

// force to refresh
-(void)showRefreshHeader:(BOOL)animated;

@end
