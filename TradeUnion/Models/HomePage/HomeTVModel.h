//
//  HomeTVModel.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/11.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeTVModel : BaseModel

@property(nonatomic,strong) NSString *thumbnail;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *publishTime;
@property(nonatomic,strong) NSString *commentNum;

@end
