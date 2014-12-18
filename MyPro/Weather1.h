//
//  Weather1.h
//  MyPro
//
//  Created by sk on 14/11/26.
//  Copyright (c) 2014年 sk. All rights reserved.
//

#import <JSONModel.h>
#import "Weather2.h"

@interface Weather1:JSONModel
@property(strong,nonatomic)Weather2* data;
@end
