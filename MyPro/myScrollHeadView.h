//
//  myScrollHeadView.h
//  MyPro
//
//  Created by sk on 14/12/9.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "myUIScrollView.h"
@interface myScrollHeadView : UIView

@property (weak, nonatomic)   UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *klk;


//@property (strong, nonatomic) IBOutlet UIView *df;
//@property (weak, nonatomic) IBOutlet UIButton *s;

//- (IBAction)changePage:(id)sender;
@property (weak, nonatomic)   UIPageControl *myPageControl;
//@property (weak, nonatomic) IBOutlet UIPageControl *xss;

-(void)MyInit:(UIView*)view;
@end
