//
//  FWFlower.m
//  FlowerWeb
//
//  Created by DH on 16/3/26.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "FWFlower.h"
#import <YYModel.h>
@interface FWFlower() <YYModel>

@end

@implementation FWFlower

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end
