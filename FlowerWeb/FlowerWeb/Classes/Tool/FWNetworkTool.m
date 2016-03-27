//
//  FWNetworkTool.m
//  FlowerWeb
//
//  Created by DH on 16/3/26.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "FWNetworkTool.h"
#import <AFNetworking.h>



@implementation FWNetworkTool


static FWNetworkTool *_instance;

+ (instancetype)shareNetworkTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[FWNetworkTool alloc] init];
    });
    
    return _instance;
}

- (void)GETWithURLString:(NSString *)URLString andParams:(NSDictionary *)params andSucces:(void(^)(id response))success andFailure:(void(^)(id error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:URLString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            NSLog(@"%@",error);
            failure(error);
        }
    }];
}

@end
