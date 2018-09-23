//
//  DetailCommentModel.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/18.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BaseModel.h"

@interface DetailCommentModel : BaseModel

@property (nonatomic,strong) NSString *userHead;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,strong) NSString *commentContent;
@property (nonatomic,strong) NSString *commentTime;

@end
