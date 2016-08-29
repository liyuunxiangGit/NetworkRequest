//
//  viewSection.h
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/29.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface viewSection : NSObject
//post方法请求
-(void)postDataWithSuccess:(void (^)(id result))success;
-(void)postDataWithName:(NSString *)name Psd:(NSString *)psd WithSuccess:(void(^)(id result))success;
//get方法请求
-(void)getDataWithSuccess:(void (^)(id result))success;
-(void)getDataWithName:(NSString *)name Psd:(NSString *)psd WithSuccess:(void(^)(id result))success;
@end
