//
//  FWHomeFlower.m
//  FlowerWeb
//
//  Created by DH on 16/3/26.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "FWHomeFlower.h"
#import <YYModel.h>
#import "FWFlower.h"
@interface FWHomeFlower() <YYModel>

@end

@implementation FWHomeFlower


+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"images":[FWFlower class],
             @"classes":[FWFlower class],
             @"features":[FWFlower class],
             @"hots":[FWFlower class],
             @"cakes":[FWFlower class],
             @"gifts":[FWFlower class],
             @"about":[FWFlower class],
             @"recommend":[FWFlower class],
             @"contact":[FWFlower class],
             };
}

@end
