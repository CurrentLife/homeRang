//
//  SWAFHTTPClient.h
//  CurrentLife
//
//  Created by mac on 15/11/25.
//  Copyright © 2015年 itcast. All rights reserved.
//
/*
  网络请求继承与 框架 AFN
 */
#import <AFNetworking/AFNetworking.h>
//给block定义别名
typedef void(^successLoadData)(id JSON);
typedef void(^failedLoadData)(NSError *error);
@interface SWAFHTTPClient : AFHTTPSessionManager
//自定义 对外接口
+ (id)shareInstance;


+ (void)getHomewithParams:(NSMutableDictionary *)param
         withSuccessBlock:(successLoadData)success
          withFailedBlock:(failedLoadData)failed;



+ (void)getURL:(NSString *)url
    withParams:(NSDictionary *)param
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed;

+ (void)postURL:(NSString *)url
     withParams:(NSDictionary *)param
withSuccessBlock:(successLoadData)success
withFailedBlock:(failedLoadData)failed;
@end
