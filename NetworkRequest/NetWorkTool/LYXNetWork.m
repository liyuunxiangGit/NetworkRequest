//
//  LYXNetWork.m
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/27.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "LYXNetWork.h"
@implementation LYXNetWork
+(LYXNetWork *)sharedManager{
    static LYXNetWork *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //一次只允许一个请求
        if (manager == nil) {
            manager = [[LYXNetWork alloc]init];
        }
    });
    return manager;
}



- (AFHTTPRequestOperationManager *)getManager{
    static AFHTTPRequestOperationManager *g_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_manager = [AFHTTPRequestOperationManager manager];
        g_manager.responseSerializer = [AFHTTPResponseSerializer serializer];    //加上这个是为了让返回的数据是二进制模式
        g_manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"application/javascript",@"audio/amr",@"text/plain", nil];
    });
    return g_manager;
}

//POST方法
- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    return [[self getManager] POST:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failure(operation,error);
    }];
    
}

//GET方法
-(AFHTTPRequestOperation *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    return [[self getManager]GET:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failure(operation,error);
    }];

}

@end
