//
//  viewSectionTwo.m
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/29.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "viewSectionTwo.h"
#import "LYXNetWork.h"

@implementation viewSectionTwo{
    void(^result_block)(NSDictionary *resultDict);
}
-(id)initWithResultBlock:(void (^)(id))success
{
    if (self = [super init]) {
        result_block = success;
    }
    return self;
}
-(void)exec
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"" forKey:@""];
    [params setObject:@"" forKey:@""];
    
    //这里传入网址   还有参数  如果参数为空  那么可以为nil
    [[LYXNetWork sharedManager] POST:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //这里可以将数据转化为对象，然后再付给success传回去。
        result_block(dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        result_block(nil);
    }];

}
@end
