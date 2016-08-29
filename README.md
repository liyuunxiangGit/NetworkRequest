# NetworkRequest
#网络请求
##这是一个封装好的网络请求
  里面有两种调用方法（都是用block调用的，但是有一个直接调用，另一个稍复杂一些，但是各有好处）：
  
##首先看用法：
  我们可以将NetWorkTool放进工程当中，然后可以模仿DiaoyongOne和DiaoyongTwo中写好的方法写个类，然后在控制器中调用。
###接下来看DiaoyongOne中的写法：
  首先确定是post 还是get方法，然后再确定是否有参数，最后往里写方法（可以直接拖DiaoyongOne中的方法），在.h文件写上如下代码的一个：
```
 .h文件中：
 //post方法请求
-(void)postDataWithSuccess:(void (^)(id result))success;
-(void)postDataWithName:(NSString *)name Psd:(NSString *)psd WithSuccess:(void(^)(id result))success;
//get方法请求
-(void)getDataWithSuccess:(void (^)(id result))success;
-(void)getDataWithName:(NSString *)name Psd:(NSString *)psd WithSuccess:(void(^)(id result))success;

 上方的block中还可以加入其它的参数，从而能返回更多：
 例如：-(void)postDataWithSuccess:(void (^)(id result，nsstring *name ,Bool elag))success;
```
在.m文件当中，我们用到.h文件中的哪个就用对用的.m文件中的哪个方法：
例如我们用了上方.h方法中的第一个方法，那么.m文件中就要写：
```
//POST方法 无参数
-(void)postDataWithSuccess:(void (^)(id result))success
{
    
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

对应上方.h文件中，block增加了东西，那么我们可以返回的也就是那么多：可以写为
success(dict,liyunxing,YES);
```
###接下来看DiaoyongTwo中的写法
在这个中调用方法基本和上方一样，只不过我们是通过-(id)initWithResultBlock:(void(^)(id result))success;和-(void)exec;两个方法同时操作进行调用
```
我们可以看代码：
#### .h 文件
#import <Foundation/Foundation.h>

@interface viewSectionTwo2 : NSObject
@property(nonatomic,copy) NSString * cflag;

-(void)exec;
-(id)initWithCache:(NSString *)cflag ResultBlock:(void (^)(id))success;
@end

#### .m文件
#import "viewSectionTwo2.h"
#import "LYXNetWork.h"
@implementation viewSectionTwo2{
    
      void(^result_block)(NSDictionary *resultDict);
}
-(id)initWithCache:(NSString *)cflag ResultBlock:(void (^)(id))success
{
    if (self = [super init]) {
        result_block = success;
        _cflag = cflag;
    }
    return self;
}
-(void)exec
{
    //这里写要传入请求的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:_cflag forKey:@"clf"];
    
    //这里传入网址   还有参数  如果参数为空  那么可以为nil
    [[LYXNetWork sharedManager] POST:@"" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //这里可以将数据转化为对象，然后再付给success传回去。
        result_block(dict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        result_block(nil);
    }];

}
@end
```
通过上方代码可以看出，我们直接调用init方法是传入参数，然后将.h定义的block也传给init方法，当在exec请求完就会直接回调回去。然后得到数据。

