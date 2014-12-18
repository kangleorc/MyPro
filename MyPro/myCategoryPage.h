//
//  myCategoryPage.h
//  MyPro
//
//  Created by sk on 14/12/8.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCategoryPage : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
