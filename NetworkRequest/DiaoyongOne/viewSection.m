//
//  viewSection.m
//  NetworkRequest
//
//  Created by 李云祥 on 16/8/29.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "viewSection.h"
#import "LYXNetWork.h"
@implementation viewSection
//POST方法 无参数
-(void)postDataWithSuccess:(void (^)(id result))success
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
        success(dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        success(nil);
    }];
}
//POST方法 有参数
-(void)postDataWithName:(NSString *)name Psd:(NSString *)psd WithSuccess:(void (^)(id))success
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:name forKey:@"name"];
    [params setObject:psd forKey:@"password"];
    
    //这里传入网址   还有参数  如果参数为空  那么可以为nil
    [[LYXNetWork sharedManager] POST:@"" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //这里可以将数据转化为对象，然后再付给success传回去。
        success(dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        success(nil);
    }];

}
//GET方法  无参数
-(void)getDataWithSuccess:(void (^)(id result))success
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"" forKey:@""];
    [params setObject:@"" forKey:@""];

     //这里传入网址   还有参数  如果参数为空  那么可以为nil
    [[LYXNetWork sharedManager] GET:@"http://cloud.bmob.cn/f8bb56aa119e68ee/news_list_2_0" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //这里可以将数据转化为对象，然后再付给success传回去。
        success(dict);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        success(nil);

    }];
}
//GET方法  有参数
-(void)getDataWithName:(NSString *)name Psd:(NSString *)psd WithSuccess:(void (^)(id))success
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:name forKey:@"name"];
    [params setObject:psd  forKey:@"password"];
    
    //这里传入网址   还有参数  如果参数为空  那么可以为nil
    [[LYXNetWork sharedManager] GET:@"http://cloud.bmob.cn/f8bb56aa119e68ee/news_list_2_0" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //这里可以将数据转化为对象，然后再付给success传回去。
        success(dict);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        success(nil);
        
    }];

}
@end
