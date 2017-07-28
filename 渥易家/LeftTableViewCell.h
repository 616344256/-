//
//  LeftTableViewCell.h
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "SmartTableViewCell.h"

@protocol leftCellDelegate <NSObject>

-(void)likeBtnwithIndex:(NSIndexPath *)index;

-(void)zanBtnwithIndex:(NSIndexPath *)index;

@end
@interface LeftTableViewCell : SmartTableViewCell
@property(nonatomic,strong)id<leftCellDelegate>delegate;
@property(nonatomic,strong)NSDictionary *model;
@property(nonatomic,strong)NSIndexPath *index;
@end
