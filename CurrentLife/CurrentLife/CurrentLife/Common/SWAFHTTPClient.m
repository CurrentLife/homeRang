//
//  SWAFHTTPClient.m
//  CurrentLife
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "SWAFHTTPClient.h"
//设置请求
#import "SWHomeModel.h"
@implementation SWAFHTTPClient
+ (id)shareInstance{
    
    static SWAFHTTPClient *client = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[SWAFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        //数列化(可接收文件类型)
        client.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    
    return client;
    
}

//示例方法  ---基类方法
- (void)getURL:(NSString *)url
    withParams:(NSDictionary *)param
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed{
    
    [self GET:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        success(responseObject);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
    
}
//获取服务器数据
+ (void)getURL:(NSString *)url
    withParams:(NSDictionary *)param
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed{
    
    [[self shareInstance]getURL:url withParams:param withSuccessBlock:success withFailedBlock:failed];
    
}



- (void)postURL:(NSString *)url
     withParams:(NSDictionary *)param
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed{
    
}

+ (void)postURL:(NSString *)url
     withParams:(NSDictionary *)param
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed{
    
}




#pragma -- 首页数据请求
+ (void)getHomewithParams:(NSMutableDictionary *)param
         withSuccessBlock:(successLoadData)success
          withFailedBlock:(failedLoadData)failed{
     [[self shareInstance]getHomewithParams:param withSuccessBlock:success withFailedBlock:failed];
 
    
}
//SWHomeViewController 发送拼接好的 --请求
- (void)getHomewithParams:(NSMutableDictionary *)param
         withSuccessBlock:(successLoadData)success
          withFailedBlock:(failedLoadData)failed{
    
    //1.根据路径  获取JSON数据
    [self getURL:@"?anu=api/1/index/get_index_info" withParams:param withSuccessBlock:^(id JSON) {
        
    //2.根据plist 文件  获取数据
        //数据解析 --转模型
        NSString *path = [[NSBundle mainBundle]pathForResource:@"home" ofType:@"plist"];
        
        NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
        
        SWHomeModel * model = [[SWHomeModel alloc]initWithDictionary:dic error:nil];
//        SNSLog(@"%@",model);
        //回调
        success(model);
        
        
    } withFailedBlock:failed];
    
}



#pragma mark --
- (void)getURL:(NSString *)url
    withParams:(NSDictionary *)param
 withClassName:(NSString *)name
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed{
    
    [self GET:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //第三步
        //        success(responseObject);
        
        Class cl = NSClassFromString(name);
        
        success([[cl alloc]initWithDictionary:responseObject]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(error);
    }];
    
}
@end
