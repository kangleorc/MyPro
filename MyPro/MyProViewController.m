//
//  MyProViewController.m
//  MyPro
//
//  Created by sk on 14/11/26.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "MyProViewController.h"
#import "AFNetworking.h"
//#import <JSONModel.h>
@interface MyProViewController (){
    Weather2*   myWeather;
    myHeadView* myHeadViewer;
    NSInteger tableY;
    BOOL isFirstTime;
}@end

@implementation MyProViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  NSArray* myArray = [[NSBundle mainBundle]loadNibNamed:@"myScrollHeadView" owner:nil options:nil];
//    
    myHeadViewer =[[myHeadView alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height-self.navigationController.navigationBar.frame.origin.y, self.view.bounds.size.width, 120) withTableView:_mytableView];
    myHeadViewer.delegater = self;
    [self.view addSubview:myHeadViewer];
    

    isFirstTime = true;
   ///////  第二个
//    myHead = [[MyScrollHeadViewController alloc]init];
//    myHead.delegater = self;
//    CGRect r = myHead.view.frame;
//    //r.origin.y = 60;
//    myHead.view.frame = r;
//    //NSString * sl = [[NSString alloc]]
//    NSLog(@"%@",NSStringFromCGRect(myHead.view.frame));
 //   [self.view addSubview:myHeadView];
//
    
    self.mytableView.backgroundColor = [UIColor clearColor];
    self.mytableView.bounces = YES;
    self.mytableView.contentInset = UIEdgeInsetsMake(0, 0, -50, 0);////???
    
    
    tableY = _mytableView.frame.origin.y;
    // self.mytableView
    //[self.mytableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.74:8080/test"];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:urlRequest];
    //operation.responseSerializer = [AFJSONResponseSerializer serializer]; init responseObject to Dictionary
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation* operation,id responseObject){
        NSLog(@"TTT%@", [responseObject class]);
         NSString* s = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
       // NSLog(@"%@",s);
        NSError *__autoreleasing * err=nil;
        myWeather = [[Weather2 alloc]initWithData:responseObject error:err];
    /*    myWeather = [[Weather2 alloc]initFromURLWithString:@"http://192.168.0.74:8080/test" completion:^(id model, JSONModelError *err) {
        }];
     */
        
      // NSString *ss =  [myWeather toJSONStringWithKeys:myWeather.dishlist] ;
        
        NSLog(@"lld%zi",myWeather.dishlist.count);
 
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        ;
    }];
   
    [operation start];
    
    /*
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameters = @{@"foo": @"bar"};
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:@"http://192.168.0.74:8080/MyWebPrj/test" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
       // NSString* s = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        // NSLog(@"%@",s);
        NSError *__autoreleasing * err=nil;
        myWeather = [[Weather2 alloc]initWithDictionary:responseObject error:err];
        NSLog(@"POST请求完成");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      //  NSLog(@"Error: %@", error);
        NSLog(@"POST请求失败: %@", error);
        
    }];
     */
    
    
   // _mytableView.frame = CGRectMake(0, 120, 400, 400);
  //  [self.view addSubview:_mytableView];
/*
    UIView* myProView = [[UIView alloc]init];
    UIImageView* myProImageView = [[UIImageView alloc]initWithFrame:self.mytableView.tableHeaderView.bounds];//CGRectMake(0, 0, 600, 90)];
    myProImageView.image = [UIImage imageNamed:@"3Stars@2x.png"];
    [myProView addSubview:myProImageView];
    self.mytableView.tableHeaderView = myProView;
*/
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)__clickEventss:(myUIScrollView *)myUIScrollViewController
{
    NSLog(@"poii");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    if(section == 2)
        return 0;
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
//
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//   
//        return nil;
//   //     myHead = [[MyScrollHeadViewController alloc]init];
//    //    myHead.delegater = self;
//    //    return myHead.view;//.subviews[0];//myProImageView;
//    }
//    return nil;
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
//    NSInteger mHeight = 0;
//    if (isFirstTime == true) {
//        tableY =_mytableView.contentOffset.y;
//        isFirstTime = false;
//    }
//    mHeight = tableY - _mytableView.contentOffset.y ;
//  //  NSLog(@"sizeof height = %zd,tableY = %zd,contentOffset =%@",mHeight,tableY,NSStringFromCGPoint(_mytableView.contentOffset));
////    NSLog(@"frame = %@",NSStringFromCGRect(_mytableView.frame));
//    if(mHeight>0)
//    {
//        [myHeadViewer viewZooming:mHeight];
//        //NSLog(@"table scroll ViewDidScroll");
//    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
   // NSLog(@"tableScroll ViewDIdEndDragging");
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
     //   UIView* myProView = [[UIView alloc]init];
      //  myProView.backgroundColor = [UIColor greenColor];
     //   UIImageView* myProImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.mytableView.bounds.size.height, self.mytableView.bounds.size.width, 30)];
      //  myProImageView.image = [UIImage imageNamed:@"1Star.png"];
      //  [myProView addSubview:myProImageView];
        return nil;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 2)
         return 0;
    return 0;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return 0;
//    }
//    return 0;
//}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cells = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cells.textLabel.text = @"Main";
    cells.detailTextLabel.text = @"Detail";
    cells.detailTextLabel.textColor = [UIColor lightGrayColor]; 
    cells.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cells.imageView.image = [UIImage imageNamed:@"1Star"];
    return cells;
}


-(void)clickScrollPage:(MyScrollHeadViewController *)myScrollHeadView num:(NSInteger)pageNum
{
    myDetailView* detailView = [[myDetailView alloc]initWithNibName:@"myDetailView" bundle:nil];
   
   /*
    [self presentViewController:detailPic animated:NO completion:^{
        CATransition *animation = [CATransition animation];
        [animation setDuration:1];
        animation.startProgress=0;
        animation.endProgress=1;
        [animation setType:kCATransitionMoveIn];
        [animation setSubtype:kCATransitionFromRight];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [[detailPic.view layer] addAnimation:animation forKey:@"SwitchToView"];
    }];
   */
    
    if(self.navigationController != nil)
    {
        NSLog(@"first %@ %@,%@",self.navigationController,self.navigationItem.title,self.navigationItem);
        detailView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailView animated:YES];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
    [self.view bringSubviewToFront:myHeadViewer];
    //[self.navigationController hidesBottomBarWhenPushed];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
