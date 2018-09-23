//
//  NSString+TUExtension.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TUExtension)

/**
 *  md5加密
 */
- (NSString*)md5HexDigest:(NSString*)input;

@end
