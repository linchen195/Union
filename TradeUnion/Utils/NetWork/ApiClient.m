//
//  ApiClient.m
//  apiTest
//
//  Created by Kaka on 2017/1/23.
//  Copyright © 2017年 Kaka. All rights reserved.
//

#import "ApiClient.h"
#import <CloudApiSdk/HttpConstant.h>


static NSString* HOST = @"apis.binzhouw.com";

@implementation ApiClient

+ (instancetype)instance {
    static dispatch_once_t onceToken;
    static ApiClient *api = nil;
    dispatch_once(&onceToken, ^{
        api = [ApiClient new];
    });
    return api;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[AppConfiguration instance] setAPP_KEY:kAPI_KEY];
        [[AppConfiguration instance] setAPP_SECRET:kAPI_SECRET];
    }
    return self;
}

/**
 *  API网关GET请求
 *
 *  @param path            除去httpGet和host之后的字符串
 *  @param parm            GET传参数的字典
 *  @param completionBlock 回调函数
 */

- (void)GetERL:(NSString *)path parm:(NSDictionary *)parm completionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completionBlock
{
    [[CloudApiSdk instance] httpGet:CLOUDAPI_HTTPS
                               host:HOST
                               path:path
                         pathParams:nil
                        queryParams:parm
                       headerParams:nil
                    completionBlock:completionBlock];
}

/**
 *  API网关POST请求
 *
 *  @param path            除去httpGet和host之后的字符串
 *  @param queryParams     在字符串拼接参数的方式
 *  @param formParams      POST请求传参数的字典
 *  @param completionBlock 回调函数
 */
- (void)postURL:(NSString *)path queryParam:(NSDictionary *)queryParams formParam:(NSDictionary *)formParams  completionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completionBlock
{
    [[CloudApiSdk instance] httpPost: CLOUDAPI_HTTPS
                                host: HOST
                                path: path
                          pathParams: nil
                         queryParams: queryParams
                          formParams: formParams
                        headerParams: nil
                     completionBlock: completionBlock];
}

@end
