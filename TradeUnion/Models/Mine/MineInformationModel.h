//
//  MineInformationModel.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BaseModel.h"

@interface MineInformationModel : BaseModel

@property (nonatomic,strong) NSString *backgroundImgURL;
@property (nonatomic,strong) NSString *imgURL;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,strong) NSString *phone;

@end
