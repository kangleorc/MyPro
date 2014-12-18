//
//  myTableViewCell.h
//  MyPro
//
//  Created by sk on 14/12/4.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tileLabel;
@property (weak, nonatomic) IBOutlet UILabel *pirceLabel;
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *valueText;

- (IBAction)minusValueEvent:(id)sender;
- (IBAction)addValueEvent:(id)sender;



@end
