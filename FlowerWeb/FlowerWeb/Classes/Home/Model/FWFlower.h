//
//  FWFlower.h
//  FlowerWeb
//
//  Created by DH on 16/3/26.
//  Copyright © 2016年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FWFlower : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *href;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *price;

@end
