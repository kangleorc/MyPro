//
//  J+Weather2.h
//  MyPro
//
//  Created by sk on 14/11/26.
//  Copyright (c) 2014年 sk. All rights reserved.
//


#import <JSONModel.h>
#import "Weather3.h"
@protocol Weather2 @end
@interface Weather2 :JSONModel

@property(strong,nonatomic)NSArray<Weather3>* dishlist;
@end
