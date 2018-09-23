//
//  NSDate+TUExtension.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TUDateItem : NSObject

/* 年月日时分秒 */
@property(nonatomic,assign)NSInteger year;
@property(nonatomic,assign)NSInteger month;
@property(nonatomic,assign)NSInteger day;
@property(nonatomic,assign)NSInteger hour;
@property(nonatomic,assign)NSInteger minute;
@property(nonatomic,assign)NSInteger second;

@end

@interface NSDate (TUExtension)

//
+(NSString *) formatDateString:(NSString *)dateString;
// 字符串转换为日期
+(NSDate*) dateFromString:(NSString *)dateString withFormat:(NSString *)format;
// 日期转换为字符串
+(NSString *) stringFromDate:(NSDate *)date withFormat:(NSString *)format;

- (NSString *)updateTimeForRow:(NSString * )timeStamp;

// 时间戳转换为时间
-(NSInteger)getTimestamp:(NSString *)time;
// 时间转换为时间戳
-(NSString *)getTimeString:(NSString *)timeStamp setDateFormat:(NSString *)dateFormat;

- (BOOL)lx_isToday;
- (BOOL)lx_isYesterday;
- (BOOL)lx_isTomorrow;
- (BOOL)lx_isThisYear;
- (NSInteger)getNowWeekday;

@end
