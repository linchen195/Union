//
//  NSDate+TUExtension.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "NSDate+TUExtension.h"

@implementation TUDateItem

-(NSString *)description{
    
    return  [NSString stringWithFormat:@"%zd天%zd小时%zd分%zd秒", self.day, self.hour, self.minute, self.second];
}
@end

@implementation NSDate (TUExtension)

+(NSString *) formatDateString:(NSString *)dateString{
    //  1. dateString -> NSDate
    //  2. 计算时间差
    //  3. 转换为字符串
    
    NSString *format =  @"E MMM dd HH:mm:ss zz yyyy";
    NSDate *date = [self dateFromString:dateString withFormat:format];
    
    NSTimeInterval distance = [[NSDate new]timeIntervalSinceDate:date];
    
    //    1分钟以内 ： 刚刚
    //    60分钟以内： 几分钟前
    //    60分钟-24小时： 几小时前
    //    >24小时 ： 几天前
    //    >3*24  :  显示日期
    
    if (distance < 24*60*60) {
        if (distance< 60*60) {
            if (distance<60) {
                return @"刚刚";
            }
            return [NSString stringWithFormat:@"%d分钟前",(int)distance/60];
        }
        return [NSString stringWithFormat:@"%d小时前",(int)distance/60/60];
    }else{
        return [NSString stringWithFormat:@"%d天前",(int)distance/60/60/24];
    }
}

// 距离当前时间时长
- (NSString *)updateTimeForRow:(NSString * )timeStamp {
    
    // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    
    // 时间差
    NSTimeInterval time = currentTime - [timeStamp integerValue];
    // 秒转分钟
    NSInteger mint = time/60;
    if (mint<60) {
        if (mint < 1) {
            return @"刚刚";
        }
        return [NSString stringWithFormat:@"%ld分钟前",(long)mint];
    }
    // 秒转小时
    NSInteger hours = time/3600;
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",(long)hours];
    }
    //秒转天数
    NSInteger days = time/3600/24;
    
    if (days==1) {
        return @"昨天";
    }else if (days<3){
        
        return [NSString stringWithFormat:@"%ld天前",(long)days];
    }
    
    return [self getTimeString:timeStamp setDateFormat:@"yyyy-MM-dd"];
}
//把日期字符串转换为NSDate  根据日期格式
+(NSDate*) dateFromString:(NSString *)dateString withFormat:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return  [formatter dateFromString:dateString];
}
//把NSDate转换为日期字符串
+(NSString *) stringFromDate:(NSDate *)date withFormat:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return  [formatter stringFromDate:date];
}

#pragma mark  把时间转化为时间戳
-(NSInteger)getTimestamp:(NSString *)time{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:time];
    
    NSInteger interval = [date timeIntervalSince1970];
    
    return interval;
}
#pragma mark  把时间戳转为时间
-(NSString *)getTimeString:(NSString *)timeStamp setDateFormat:(NSString *)dateFormat {
    NSString *str = timeStamp;//时间戳
    
    NSTimeInterval time=[str doubleValue];//因为时差问题要加8小时 == 28800 sec
    
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:dateFormat];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    return currentDateStr;    
}

- (BOOL)lx_isToday{
    // 判断self这个日期对象是否为今天
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 如果selfCmps和nowCmps的所有元素都一样，就返回YES，否则返回NO
    return [selfCmps isEqual:nowCmps];
    //    return selfCmps.year == nowCmps.year
    //    && selfCmps.month == nowCmps.month
    //    && selfCmps.day == nowCmps.day;
}

- (BOOL)lx_isYesterday{
    // 判断self这个日期对象是否为昨天
    
    // self 2015-12-09 22:10:01 -> 2015-12-09 00:00:00
    // now  2015-12-10 12:10:01 -> 2015-12-01 00:00:00
    // 昨天：0year 0month 1day 0hour 0minute 0second
    
    // NSDate * -> NSString * -> NSDate *
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 生成只有年月日的字符串对象
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    // 生成只有年月日的日期对象
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

- (BOOL)lx_isTomorrow
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    // 生成只有年月日的字符串对象
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    // 生成只有年月日的日期对象
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}

- (BOOL)lx_isThisYear
{
    // 判断self这个日期对象是否为今年
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger selfYear = [calendar components:NSCalendarUnitYear fromDate:self].year;
    NSInteger nowYear = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]].year;
    
    return selfYear == nowYear;
}

//获取今天周几
- (NSInteger)getNowWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDate *now = [NSDate date];
    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    comps = [calendar components:unitFlags fromDate:now];
    return [comps day];
}

@end
