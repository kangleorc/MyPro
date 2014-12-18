//
//  myTableViewCell.m
//  MyPro
//
//  Created by sk on 14/12/4.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {
    // Initialization code
  //  self.backgroundColor = [UIColor redColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _addBtn.backgroundColor = [UIColor clearColor];
    _addBtn.layer.borderColor = [[UIColor blackColor]CGColor];
    _addBtn.titleLabel.text = @"+";
    _addBtn.layer.borderWidth = 1;
    _addBtn.layer.cornerRadius = 8.0;
    _addBtn.layer.masksToBounds = YES;
   // [_addBtn setAdjustsImageWhenHighlighted:NO];
    //[_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   // [self.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:self.titleLabel.font.pointSize]];
    
    _minusBtn.backgroundColor = [UIColor clearColor];
    _minusBtn.layer.borderColor = [[UIColor blackColor]CGColor];
    _minusBtn.titleLabel.text = @"-";
    _minusBtn.layer.borderWidth = 1;
    _minusBtn.layer.cornerRadius = 8.0;
    _minusBtn.layer.masksToBounds = YES;
    
    _valueText.alpha = 1;
    _valueText.text = @"1";
    _valueText.layer.borderWidth = 0.1;
   // _valueText.borderStyle = UITextBorderStyleNone;
    _valueText.layer.borderColor = [[UIColor clearColor]CGColor];
    _valueText.backgroundColor = [UIColor whiteColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)minusValueEvent:(id)sender {
    if([self.valueText.text isEqualToString:@"1"])
        return ;
    int i = [self.valueText.text intValue];
    i--;
    NSString* textStr = [[NSString alloc]initWithFormat:@"%d",i];
    self.valueText.text = textStr;
}

- (IBAction)addValueEvent:(id)sender {
    if([self.valueText.text isEqualToString:@"99"])
        return ;
    NSLog(@"%@",self.valueText.text);
    int i = [self.valueText.text intValue];
    i++;
    self.valueText.text = [[NSString alloc]initWithFormat:@"%d",i];
}
@end
