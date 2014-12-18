//
//  MyScrollHeadViewController.h
//  MyPro
//
//  Created by sk on 14/11/27.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myUIScrollView.h"

@class MyScrollHeadViewController;
@protocol myScrollHeadViewDelegater <NSObject>
-(void)clickScrollPage:(MyScrollHeadViewController*)myScrollHeadView num:(NSInteger)pageNum;
@end

@interface MyScrollHeadViewController : UIViewController<myUIScrollViewDelete,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet myUIScrollView *myScrollView;
@property (weak,nonatomic  )IBOutlet UIPageControl * myPageControl;
- (IBAction)changePage:(id)sender;
@property (nonatomic, assign) id <myScrollHeadViewDelegater> delegater;
@end
