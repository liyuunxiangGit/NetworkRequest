//
//  LYXNetWork.h
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/27.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
@interface LYXNetWork : NSObject
//单例自行实例化
+(LYXNetWork *)sharedManager;




- (AFHTTPRequestOperationManager *)getManager;

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                            parameters:(id)parameters
                            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                            parameters:(id)parameters
                            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
