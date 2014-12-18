//
//  UIScrollView+myUIScrollView.h
//  MyPro
//
//  Created by sk on 14/12/2.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myUIScrollView;

@protocol myUIScrollViewDelete <NSObject>
-(void)__clickEventss;//:(myUIScrollView*)myUIScrollViewController;
@end


@interface myUIScrollView : UIScrollView
 
@property (nonatomic, weak) id <myUIScrollViewDelete> delegater;

@end


