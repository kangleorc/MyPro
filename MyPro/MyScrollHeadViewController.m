//
//  MyScrollHeadViewController.m
//  MyPro
//
//  Created by sk on 14/11/27.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "MyScrollHeadViewController.h"

@interface MyScrollHeadViewController ()
{
    BOOL isFromStart;
}
@property(nonatomic, strong)NSTimer* timer;
@property(nonatomic, strong)NSArray  *arrayImages;
@property(nonatomic, strong)NSMutableArray *viewControllerArray;
@end

@implementation MyScrollHeadViewController

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
  //  NSLog(NSString *format, ...)
    _arrayImages = [[NSArray alloc ]initWithObjects:[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"],
    [UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],nil];
    //add Images;
    
    self.view.backgroundColor = [UIColor redColor];
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
    self.myScrollView.delegater = self;
    //[_myScrollView canBecomeFirstResponder = YES;
    NSLog(@"ll = %@",NSStringFromCGRect(self.view.frame));
    [self.myScrollView setContentSize:CGSizeMake(self.myScrollView.frame.size.width*[_arrayImages count], 0)];
    NSLog(@"sizesss = %@",NSStringFromCGSize(self.myScrollView.contentSize));

    _viewControllerArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self.arrayImages count]; i++)
    {
        [_viewControllerArray addObject:[NSNull null]];
    }
     _timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(scrollPages) userInfo:nil repeats:YES];
    [self loadViewScrollPage:0];
    [self loadViewScrollPage:1];
    [self loadViewScrollPage:2];
    [self loadViewScrollPage:3];
   // self.myScrollView
   // NSArray* nsArray = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"2Stars.png"],[UIImage imageNamed:@"3Stars.png"], nil];
//    self.myPageControl.bounds.size.height = 120;
    // Do any additional setup after loading the view from its nib.
    
    [_timer invalidate];
}

-(void)loadViewScrollPage:(NSInteger)page
{
    if(page >= [_arrayImages count])
        return ;
  /*  UIButton* scrollBtnPic = [self.viewControllerArray objectAtIndex:page];
    if((NSNull *)scrollBtnPic == [NSNull null])
    {
        scrollBtnPic = [[UIButton alloc ]init];
        [self.viewControllerArray replaceObjectAtIndex:page withObject:scrollBtnPic];
        scrollBtnPic.backgroundColor = [UIColor clearColor];
    }
   // if(scrollBtnPic.imageView.superview == nil)
   // {
        CGRect frame = self.myScrollView.frame;
        frame.origin.x = CGRectGetWidth(frame)*page;
        frame.origin.y = 0;
        scrollBtnPic.frame = frame;
        //scrollBtnPic.imageView.frame = frame;
        //[scrollBtnPic.imageView setImage:(UIImage*)[self.arrayImages objectAtIndex:page]];
        [scrollBtnPic setImage:(UIImage*)[self.arrayImages objectAtIndex:page] forState:UIControlStateNormal |UIControlStateHighlighted];//原图
     //   [scrollBtnPic setBackgroundImage :(UIImage*)[self.arrayImages objectAtIndex:page] forState:UIControlStateNormal]; 这个会拉伸图片 使图片充满
        [self.myScrollView addSubview:scrollBtnPic];
    //}*/
    
    
   // UIControlStateNormal
    UIViewController *imageViewController = [self.viewControllerArray objectAtIndex:page];
    if ((NSNull *)imageViewController == [NSNull null])
    {
        imageViewController = [[UIViewController alloc] init];
        [self.viewControllerArray replaceObjectAtIndex:page withObject:imageViewController];
    }
    
     if (imageViewController.view.superview == nil)
     {
        CGRect frame = self.myScrollView.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        imageViewController.view.frame = frame;
       //[self addChildViewController:imageViewController];
        [self.myScrollView addSubview:imageViewController.view];
       // [imageViewController didMoveToParentViewController:self];
        [imageViewController.view setBackgroundColor:[UIColor colorWithPatternImage:(UIImage *)[self.arrayImages objectAtIndex:page]]];
     }
   // NSLog(@"111");
   /*
    UIImageView *imageview = nil;
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap =
    [imageview addGestureRecognizer:<#(UIGestureRecognizer *)#>]
    */
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.myScrollView.frame);
    NSInteger page = floor((self.myScrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
    self.myPageControl.currentPage = page;
    
    [self loadViewScrollPage:page-1];
    [self loadViewScrollPage:page];
    [self loadViewScrollPage:page+1];
//   NSLog(@"123");
}

-(IBAction)changePage:(id)sender
{
    NSInteger page = self.myPageControl.currentPage;
    
    [self loadViewScrollPage:page - 1];
    [self loadViewScrollPage:page];
    [self loadViewScrollPage:page + 1];
    
    CGRect bounds = self.myScrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.myScrollView scrollRectToVisible:bounds animated:YES];
   //  NSLog(@"345");
}

-(void)scrollViewDidScroll:(myUIScrollView *)scrollView
{
    NSLog(@"opqeiruuruutyye");
}

-(void)scrollPages
{
    ++self.myPageControl.currentPage;
    CGFloat pageWidth = CGRectGetWidth(self.myScrollView.frame);
    if (isFromStart)
    {
        [self.myScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        self.myPageControl.currentPage = 0;
    }else{
        [self.myScrollView setContentOffset:CGPointMake(pageWidth*self.myPageControl.currentPage, self.myScrollView.bounds.origin.y)];
        }
    
    if (_myPageControl.currentPage == _myPageControl.numberOfPages - 1)
    {
        isFromStart = YES;
    }else{
            isFromStart = NO;
         }
   //  NSLog(@"567");
}
-(void)__clickEventss//:(myUIScrollView *)myUIScrollViewController
{
    if([self.delegater respondsToSelector:@selector(clickScrollPage:num:)])
        [self.delegater clickScrollPage:self num:self.myPageControl.currentPage];
// NSLog(@"Clicked");
}



/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/


/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"I have been touched");
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"I have been touched moved");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"I have been touched end");
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"I have been touched cancel");
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
