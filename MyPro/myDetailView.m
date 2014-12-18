//
//  myDetailView.m
//  MyPro
//
//  Created by sk on 14/12/3.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myDetailView.h"
//#import <CoreText/CoreText.h>
@interface myDetailView ()

@end

@implementation myDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.navigationController == nil)
    {
        NSLog(@"jkjkjk");
    }
    
    self.myTableView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
    //self.myToolBar.frame = CGRectMake(0, self.view.bounds.size.height-44, 600, 44);
 //   UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
//    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
//    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
//    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
//    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
    //self.navigationController
    
    UIBarButtonItem* one = [[UIBarButtonItem alloc]initWithCustomView:self.myToolBar];
    [self setToolbarItems:[NSArray arrayWithObjects:one, nil]];
    self.myToolBar.backgroundColor = [UIColor lightGrayColor];
   // NSLog(@"self mytoolBar frame = %@",NSStringFromCGRect( self.myToolBar.bounds));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        //[animation setSubtype:kCATransitionFromBottom];
       // self.myToolBar.alpha = 0;
        self.myToolBar.alpha = 1;
        self.myToolBar.frame = CGRectMake(0, self.view.bounds.size.height-44, 600, 44);
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden = NO;
    self.navigationController.toolbarHidden = YES;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 1)
        return 4;
    
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        MyScrollHeadViewController *myHead = [[MyScrollHeadViewController alloc]init];
        return  myHead.view;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
       return 300 ;//return 120;
    return 0;
}
-(void)__clickEventss
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
        return 120;
    return 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"CellId";
    if(indexPath.row == 0)
    {
        myTableViewCell* cells = [tableView dequeueReusableCellWithIdentifier:CellId];
        if (cells == nil) {
            NSArray *objs= [[NSBundle mainBundle] loadNibNamed:@"myTableViewCell" owner:self options:nil] ;
                cells = [objs lastObject];
                cells.tileLabel.text = @"This is my First DIY TableViewCell!";
              
                NSString *text = @"￥this ￥test !";
               
              //  NSAttributedString* nsString = [[NSAttributedString alloc] initWithString:text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleNone), NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
              //  NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithAttributedString:nsString];
                
                NSMutableAttributedString* attriString = [[NSMutableAttributedString alloc]initWithString:text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleNone), NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
                
  //               NSDictionary* textDic = @{NSForegroundColorAttributeName :[UIColor lightGrayColor],
//NSStrikethroughStyleAttributeName:[NSNumber numberWithInt: NSUnderlineStyleSingle]};
              
              //  [attriString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,5)];
               // [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:32] range:NSMakeRange(1, 4)];
                //[attriString addAttributes:textDic range:NSMakeRange(6, 5)];
               
                [attriString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(6, 5)];
                [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(6, 5)];
                [attriString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(6,5)];
                [cells.pirceLabel setAttributedText:attriString];
              
//                [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
//                                    value:(id)[UIColor redColor].CGColor
//                                    range:NSMakeRange(0, 4)];
//                //把is变为黄色
//                [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
//                                    value:(id)[UIColor yellowColor].CGColor
//                                    range:NSMakeRange(5, 2)];
//                //改变this的字体，value必须是一个CTFontRef
            //    [attriString addAttribute:nil value:(id)CFFontCreateWithName((NSStringRef)[UIFont boldSystemFontOfSize:14].fontName,14,NULL)range:NSMakeRange(0, 4)];
//                //给this加上下划线，value可以在指定的枚举中选择
            }
          //myTableViewCell* cellss = [[myTableViewCell alloc]init];
           // cellss.backgroundColor = [UIColor greenColor];
            return cells;
        }
    UITableViewCell* cells = [tableView dequeueReusableCellWithIdentifier:CellId];
    if(cells == nil);
    {
        cells = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cells.selectionStyle = UITableViewCellSelectionStyleNone;
        cells.textLabel.text = @"Text Other Cell";
        cells.detailTextLabel.text = @"Others";
        cells.detailTextLabel.textColor = [UIColor lightGrayColor];
        return cells;
    }
    return nil;
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
