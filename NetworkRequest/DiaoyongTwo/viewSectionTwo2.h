//
//  viewSectionTwo2.h
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/29.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface viewSectionTwo2 : NSObject
@property(nonatomic,copy) NSString * cflag;

-(void)exec;
-(id)initWithCache:(NSString *)cflag ResultBlock:(void (^)(id))success;
@end
