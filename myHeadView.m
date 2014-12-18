//
//  myHeadView.m
//  MyPro
//
//  Created by sk on 14/12/10.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myHeadView.h"


@interface myHeadView()
{
    BOOL isFromStart;
    float  fStartHeight;
    float  fLastHeight;
    BOOL ischangeStart;
}
@property(nonatomic, strong)NSTimer* timer;
@property(nonatomic, strong)NSArray  *arrayImages;
@property(nonatomic, strong)UITableView *parentTableview;
@property(nonatomic, strong)NSMutableArray *viewControllerArray;
@end

@implementation myHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
 
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrill");
}

-(instancetype)initWithFrame:(CGRect)frame withTableView:(UITableView*)view
{
    self = [super initWithFrame:frame];
    _myScrollView = [[myUIScrollView alloc]initWithFrame:frame];
    _myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, frame.origin.y + frame.size.height/6*5,frame.size.width, frame.size.height/6)];
    _arrayImages = [[NSArray alloc ]initWithObjects:[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],nil];
    NSLog(@"init frame = %@",NSStringFromCGRect(frame));
    _parentTableview = view;
    ischangeStart = YES;
    self.backgroundColor = [UIColor lightGrayColor];
#pragma mark -- PageControl_property
    [self.myPageControl setBackgroundColor:[UIColor clearColor]];
    self.myPageControl.numberOfPages = [_arrayImages count];
    self.myPageControl.alpha = 0.4;
    self.myPageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.myPageControl.currentPage = 0;
    [_myPageControl addTarget:self action:@selector(changePage11:) forControlEvents:UIControlEventTouchDown];
//    UIViewController* ll = [[UIViewController alloc]init];
   
#pragma mark -- ScroView_property
    //self.myScrollView.maximumZoomScale = 2;
    // self.myScrollView.minimumZoomScale = 0.5;
    self.myScrollView.backgroundColor = [UIColor redColor];
    self.myScrollView.showsHorizontalScrollIndicator = NO;
    self.myScrollView.bounces = NO;
    [self.myScrollView setPagingEnabled:YES];
    [self.myScrollView setDelegate:self ];
    self.myScrollView.delegater = self;
    [self.myScrollView setBouncesZoom:YES];
//    self.myScrollView.maximumZoomScale = 5;
//    self.myScrollView.minimumZoomScale = 1;
//    self.myScrollView.zoomScale = 1;
    [self.myScrollView setContentSize:CGSizeMake(self.myScrollView.frame.size.width*[_arrayImages count], 0)];
    
   // [view addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [_myScrollView addObserver:self forKeyPath:@"panGestureRecognizer.state" options:NSKeyValueObservingOptionNew context:nil];
    //[_myScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
   
    _viewControllerArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self.arrayImages count]; i++)
    {
        [_viewControllerArray addObject:[NSNull null]];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(scrollPages) userInfo:nil repeats:YES];
    [self addSubview:_myScrollView];
    [self addSubview:_myPageControl];

    [self loadViewScrollPage:0];
    [self loadViewScrollPage:1];
    [self loadViewScrollPage:2];
    [self loadViewScrollPage:3];
    
   //    for (UIView *tempView in self.subviews) {
//        NSLog(@"%@", tempView);
//    }
    
    return self;
}
-(void)update
{
    float fChangedHeigit = 0;
    if(ischangeStart==YES)
    {
        ischangeStart = NO;
        fStartHeight = _parentTableview.contentOffset.y;
        fLastHeight = fStartHeight;
    }
    if(_parentTableview.contentOffset.y - fStartHeight >= 0)
    {
        return ;
    }
    fChangedHeigit = fLastHeight - _parentTableview.contentOffset.y;
    fLastHeight = _parentTableview.contentOffset.y;
 
    UIImageView *imgTmp;
    for (UIView *view in self.myScrollView.subviews) {
        if ([view isKindOfClass:[UIView class]]) {
            if (view.tag == 10+ _myPageControl.currentPage) {
                imgTmp = (UIImageView*)view;
            }
        }
    }
    // [myUIScrollView animateWithDuration:0.1 animations:^{
    CGRect framee;
    self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height+fChangedHeigit);
    _myScrollView.frame = self.frame;
    framee = self.frame;
    framee.origin.y = 0;
    framee.origin.x = 600*_myPageControl.currentPage;
    imgTmp.frame = framee;//_myScrollView.frame;
}
-(void)layoutSubviews
{
    
    [super layoutSubviews];
    [self update];
//   // [myUIScrollView animateWithDuration:0.1 animations:^{
//        
//         self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height+fChangedHeigit);
//        imgTmp.frame = self.frame;
//        _myScrollView.frame = self.frame;
  //  }];
   
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  //  NSLog(@"set,%d,%d",_myScrollView.panGestureRecognizer.state,UIGestureRecognizerStateBegan);//NSStringFromCGPoint(_myScrollView.contentOffset));
    [self setNeedsLayout];
}

- (void)changePage11:(id)sender {
    NSInteger page = self.myPageControl.currentPage;

    [self loadViewScrollPage:page - 1];
    [self loadViewScrollPage:page];
    [self loadViewScrollPage:page + 1];

    CGRect bounds = _myScrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [_myScrollView scrollRectToVisible:bounds animated:YES];
    NSLog(@"changePage view");
}


-(void)loadViewScrollPage:(NSInteger)pageNum
{
    if(pageNum>=[_arrayImages count])
        return ;
   // UIViewController* imageViewCon = [_viewControllerArray objectAtIndex:pageNum];
    UIImageView* imageViewCon = [_viewControllerArray objectAtIndex:pageNum];
    if ((NSNull *)imageViewCon == [NSNull null]) {
        imageViewCon = [[UIImageView alloc]initWithImage:[_arrayImages objectAtIndex:pageNum]];
        [_viewControllerArray replaceObjectAtIndex:pageNum withObject:imageViewCon];
    }
    //if(imageViewCon.view.superview == nil)   //////ask
 //   {
        CGRect fram = _myScrollView.frame;
        fram.origin.x =  CGRectGetWidth(fram) * pageNum;
        fram.origin.y = 0;
        imageViewCon.frame = fram;
        imageViewCon.tag = 10 + pageNum;
    
        //imageViewCon = [_arrayImages objectAtIndex:pageNum];
        [_myScrollView addSubview:imageViewCon];
       // imageViewCo
       // [imageViewCon setBackgroundColor:[UIColor colorWithPatternImage:[_arrayImages objectAtIndex:pageNum]]];
    
   // }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.myScrollView.frame);
    NSInteger page = floor((_myScrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
    self.myPageControl.currentPage = page;
    
    [self loadViewScrollPage:page-1];
    [self loadViewScrollPage:page];
    [self loadViewScrollPage:page+1]; 
}
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView
-(void)viewZooming:(NSInteger)size
{
   // _myScrollView.frame = CGRectMake(0 ,size, _myScrollView.frame.size.width,_myScrollView.frame.size.height);
}


-(void)__clickEventss
{
    if([self.delegater respondsToSelector:@selector(clickScrollPage:num:)])
        [self.delegater clickScrollPage:self num:self.myPageControl.currentPage];
}
#pragma mark --- MayBe Using
//-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    NSLog(@"scrollViewWillBeginDragging");
//}
//
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    NSLog(@"scrollViewWillEndDragging");
//}
//
//-(void)scrollViewDidZoom:(UIScrollView *)scrollView
//{
//    NSLog(@"scrollViewDidZoom");
//}
//
//-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
//{
//    NSLog(@"scrollViewWillBeginZooming");
//}



@end
