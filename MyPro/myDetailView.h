//
//  myDetailView.h
//  MyPro
//
//  Created by sk on 14/12/3.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "myTableViewCell.h"
#include "MyScrollHeadViewController.h"
@interface myDetailView : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) IBOutlet UIView *myToolBar;


@end
