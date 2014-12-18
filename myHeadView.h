//
//  myHeadView.h
//  MyPro
//
//  Created by sk on 14/12/10.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myUIScrollView.h"


@class myHeadView;
@protocol myHeadViewDelegater <NSObject>
-(void)clickScrollPage:(myHeadView*)myScrollHeadView num:(NSInteger)pageNum;
@end

@interface myHeadView : UIView<myUIScrollViewDelete,UIScrollViewDelegate>
@property(strong,nonatomic) UIView *myBackView;
@property(strong,nonatomic) myUIScrollView *myScrollView;
@property(strong,nonatomic) UIPageControl *myPageControl;

@property (nonatomic, assign) id <myHeadViewDelegater> delegater;

-(instancetype)initWithFrame:(CGRect)frame withTableView:(UITableView*)view;
-(void)viewZooming:(NSInteger)size;

- (void)changePage11:(id)sender;
@end
