# NetworkRequest
#网络请求
##这是一个封装好的网络请求
  ···//这里写要传入请求的参数
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
