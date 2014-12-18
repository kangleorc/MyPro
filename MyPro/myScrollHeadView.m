//
//  myScrollHeadView.m
//  MyPro
//
//  Created by sk on 14/12/9.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myScrollHeadView.h"
@interface myScrollHeadView()
{
    BOOL isFromStart;
}
@property(nonatomic, strong)NSTimer* timer;
@property(nonatomic, strong)NSArray  *arrayImages;
@property(nonatomic, strong)NSMutableArray *viewControllerArray;
@end


@implementation myScrollHeadView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"xxkd");
}
-(void)scrollPages
{
    ++_myPageControl.currentPage;
    CGFloat pageWidth = CGRectGetWidth(_myScrollView.frame);
    if (isFromStart)
    {
        [self.myScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        self.myPageControl.currentPage = 0;
    }else{
        [self.myScrollView setContentOffset:CGPointMake(pageWidth*_myPageControl.currentPage, _myScrollView.bounds.origin.y)];
    }
    
    if (_myPageControl.currentPage == _myPageControl.numberOfPages - 1)
    {
        isFromStart = YES;
    }else{
        isFromStart = NO;
    }
    NSLog(@"scrollPage view");
}

-(void)MyInit:(UIScrollView*)view
{
    _arrayImages = [[NSArray alloc ]initWithObjects:[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"],
                    [UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],nil];
    //add Images;
    
    //self.backgroundColor = [UIColor redColor];
    [self.myPageControl setBackgroundColor:[UIColor lightGrayColor]];
    self.myPageControl.numberOfPages = [_arrayImages count];
    self.myPageControl.alpha = 0.5;
    self.myPageControl.currentPage = 0;
    //self.myScrollView.maximumZoomScale = 2;
    // self.myScrollView.minimumZoomScale = 0.5;
    self.myScrollView.backgroundColor = [UIColor lightGrayColor];
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.bounces = NO;
    [self.myScrollView setPagingEnabled:YES];
    //self.mySrcollView.delegater = self;
    //[_myScrollView canBecomeFirstResponder = YES;
    // NSLog(@"ll = %@",NSStringFromCGRect(self.view.frame));
    [self.myScrollView setContentSize:CGSizeMake(self.myScrollView.frame.size.width*[_arrayImages count], 0)];
    NSLog(@"sizesss = %@",NSStringFromCGSize(self.myScrollView.contentSize));
    
    _viewControllerArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self.arrayImages count]; i++)
    {
        [_viewControllerArray addObject:[NSNull null]];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollPages) userInfo:nil repeats:YES];
    [self loadViewScrollPage:0];
    [self loadViewScrollPage:1];
    [self loadViewScrollPage:2];
    [self loadViewScrollPage:3];
}

-(void)loadViewScrollPage:(NSInteger)pageNum
{
    if(pageNum>=[_arrayImages count])
        return ;
    UIViewController* imageViewCon = [_viewControllerArray objectAtIndex:pageNum];
    if ((NSNull *)imageViewCon == [NSNull null]) {
        imageViewCon = [[UIViewController alloc]init];
        [_viewControllerArray replaceObjectAtIndex:pageNum withObject:imageViewCon];
        NSLog(@"alloc num = %zd view",pageNum);
    }
    if(imageViewCon.view.superview == nil)   //////ask
    {
        CGRect fram = _myScrollView.frame;
        fram.origin.x = _myScrollView.frame.origin.x * pageNum;
        fram.origin.y = 0;
        imageViewCon.view.frame = fram;
        [imageViewCon.view setBackgroundColor:[UIColor colorWithPatternImage:[_arrayImages objectAtIndex:pageNum]]];
        
        NSLog(@"loadViewScrollPage num = %zd view",pageNum);
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.myScrollView.frame);
    NSInteger page = floor((_myScrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
    self.myPageControl.currentPage = page;
    
    [self loadViewScrollPage:page-1];
    [self loadViewScrollPage:page];
    [self loadViewScrollPage:page+1];
    NSLog(@"scrollViewDidEndDecelerating view");
    
}


//- (IBAction)changePage:(id)sender {
//    NSInteger page = self.myPageControl.currentPage;
//    
//    [self loadViewScrollPage:page - 1];
//    [self loadViewScrollPage:page];
//    [self loadViewScrollPage:page + 1];
//    
//    CGRect bounds = _myScrollView.bounds;
//    bounds.origin.x = CGRectGetWidth(bounds) * page;
//    bounds.origin.y = 0;
//    [_myScrollView scrollRectToVisible:bounds animated:YES];
//    NSLog(@"changePage view");
//}



@end
