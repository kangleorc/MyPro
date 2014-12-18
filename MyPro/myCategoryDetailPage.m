//
//  myCategoryDetailPage.m
//  MyPro
//
//  Created by sk on 14/12/8.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myCategoryDetailPage.h"

@interface myCategoryDetailPage ()

@end

@implementation myCategoryDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl* ls = [[UISegmentedControl alloc]init];
    [_myTableView setTableHeaderView:ls];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString* CellID = @"CellID";
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
