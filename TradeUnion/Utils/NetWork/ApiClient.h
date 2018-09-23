//
//  ApiClient.h
//  apiTest
//
//  Created by Kaka on 2017/1/23.
//  Copyright © 2017年 Kaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudApiSdk/CloudApiSdk.h>

@interface ApiClient : NSObject
+(instancetype)instance;

/**
 *  API网关POST请求
 *
 *  @param path            除去httpGet和host之后的字符串
 *  @param queryParams     在字符串拼接参数的方式
 *  @param formParams      POST请求传参数的字典
 *  @param completionBlock 回调函数
 */

- (void)postURL:(NSString *)path queryParam:(NSDictionary *)queryParams formParam:(NSDictionary *)formParams  completionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completionBlock;
/**
 *  API网关GET请求
 *
 *  @param path            除去httpGet和host之后的字符串
 *  @param parm            GET传参数的字典
 *  @param completionBlock 回调函数
 */
- (void)GetERL:(NSString *)path parm:(NSDictionary *)parm completionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completionBlock;
@end
