//
//  FWNetworkTool.h
//  FlowerWeb
//
//  Created by DH on 16/3/26.
//  Copyright © 2016年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FWNetworkTool : NSObject

+ (instancetype)shareNetworkTool;

- (void)GETWithURLString:(NSString *)URLString andParams:(NSDictionary *)params andSucces:(void(^)(id response))success andFailure:(void(^)(id error))failure;

@end
