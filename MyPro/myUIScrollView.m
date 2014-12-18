//
//  UIScrollView+myUIScrollView.m
//  MyPro
//
//  Created by sk on 14/12/2.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myUIScrollView.h"


@implementation myUIScrollView

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
    //NSLog(@"began");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event] ;
   // NSLog(@"ended");
    if([_delegater respondsToSelector:@selector(__clickEventss)])
    {
        [_delegater __clickEventss];
    }
}*/

//- (IBAction)changePage:(id)sender {
//    NSInteger page = self.myPageControl.currentPage;
//    
//    [_mySrcollView loadViewScrollPage:page - 1];
//    [_mySrcollView loadViewScrollPage:page];
//    [_mySrcollView loadViewScrollPage:page + 1];
//    
//    CGRect bounds = _mySrcollView.bounds;
//    bounds.origin.x = CGRectGetWidth(bounds) * page;
//    bounds.origin.y = 0;
//    [_mySrcollView scrollRectToVisible:bounds animated:YES];
//    NSLog(@"changePage view");
//}

/*
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"cancelled");
}*/
/*
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    NSLog(@"moved");
    
}*/

@end
