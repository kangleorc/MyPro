//
//  MyProViewController.h
//  MyPro
//
//  Created by sk on 14/11/26.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModelLib.h>
#import "Weather2.h"
#import "myDetailView.h"
#import "myHeadView.h"
//#import "MyScrollHeadViewController.h"
@interface MyProViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,myHeadViewDelegater>

@property (weak, nonatomic) IBOutlet UITableView *mytableView;

@end
