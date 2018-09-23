//
//  BaseModel.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BaseModel.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)

@implementation BaseModel

- (instancetype)initWithDic:(NSDictionary *)dictionary{
    
    if (self = [super init]) {
        
        [self setAttributes:dictionary];
    }
    return self;
}

- (void)setAttributes:(NSDictionary *)dictionary{
    
    //1.获取字典的所有key
    NSArray *allkeys = [dictionary allKeys];
    
    //2.遍历所有的key
    for (NSString *key in allkeys) {
        
        /**
         *  假设本次进入方法时 获取的key是@"img"
         
         通过key构建set方法 : "setImg:"
         */
        
        //3. 将字符串转换成方法 获得各个属性的set 方法
        SEL setSelector = [self selFromAttributeName:key];
        
        //4.判断本次构建的set方法 是否被本类对象响应 (如果yes说明存在这个属性)
        if ([self respondsToSelector:setSelector]) {
            
            //5.获取key对应的字典中的对象
            id object = [dictionary objectForKey:key];
            
            //6.将对象通过set方法保存到属性里 setImg:
            SuppressPerformSelectorLeakWarning([self performSelector:setSelector withObject:object];);
            
//                [self performSelectorOnMainThread:setSelector withObject:[dictionary objectForKey:object] waitUntilDone:[NSThread isMainThread]];

        }
        
        /* ———————————————————————— 属性名和字典key不相同的情况 —————————————————————————— */
        
        for (NSString *mapKey in [self.mapDic allKeys]) {
            
            //从mapDic中获取对象 -> 新的属性名字符串
            NSString *attributeName = [self.mapDic objectForKey:mapKey];
            
            //通过新的属性名 构建set方法
            SEL setMehod = [self selFromAttributeName:attributeName];
            
            //获取数据字典中的对象
            id object = [dictionary objectForKey:mapKey];
            
            if ([self respondsToSelector:setMehod]) {
                
                //通过set方法 保存字典的值到属性中
                #pragma clang diagnostic push
                #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self performSelector:setMehod withObject:object];
                #pragma clang diagnostic pop
                
                //[self performSelectorOnMainThread:setSelector withObject:[dictionary objectForKey:object] waitUntilDone:[NSThread isMainThread]];

            }
        }
    }
}

- (SEL)selFromAttributeName:(NSString *)attributeName{
    
    //获取key的首字母并变成大写  :  img -> 获取i -> 变成I
    NSString *firstChar = [[attributeName substringToIndex:1]uppercaseString];
    
    //获取key的首字母意外的字符串 保持不变 : mg
    NSString *otherChars = [attributeName substringFromIndex:1];
    
    //将大写的首字母和不变其他字符串拼接成set方法 : setImg:
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:",firstChar,otherChars];
    
    //构建SEL类型的set方法
    SEL setSelector = NSSelectorFromString(setMethod);
    
    return setSelector;
    
}

@end
