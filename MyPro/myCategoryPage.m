//
//  myCategoryPage.m
//  MyPro
//
//  Created by sk on 14/12/8.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myCategoryPage.h"
#import "myDetailView.h"
@interface myCategoryPage ()

@end

@implementation myCategoryPage

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.bounces = YES;
    _myTableView.contentInset = UIEdgeInsetsMake(0, 0, -50, 0);
    _myTableView.allowsSelection = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSLog(@"in select row = %zd",indexPath.row);
    myDetailView* nextPage = [[myDetailView alloc]initWithNibName:@"myDetailView" bundle:nil];
    //UIViewController* nnn = [[UIViewController alloc]init];
    if(self.navigationController != nil)
    {
        [self.navigationController pushViewController:nextPage animated:YES];
        NSLog(@"out select row = %zd",indexPath.row);
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [_myTableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        NSString *str = [[NSString alloc]initWithFormat:@"第%zd类",indexPath.row];
        cell.detailTextLabel.text = @"detail";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:@"1Star"];
        cell.textLabel.text = str;
    }
    return cell;
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
