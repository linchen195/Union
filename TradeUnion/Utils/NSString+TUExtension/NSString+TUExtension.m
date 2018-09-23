//
//  NSString+TUExtension.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "NSString+TUExtension.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

#define  MD5_LENGTH   32

@implementation NSString (TUExtension)

// MD5加密
- (NSString*)md5HexDigest:(NSString*)input {
    const char * str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
