//
//  RightTableViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "RightTableViewCell.h"
@interface RightTableViewCell ()
@property (nonatomic, strong) UIImageView *bgimageView;
@end

@implementation RightTableViewCell

-(id)initWithCellIdentifier:(NSString *)cellID{
    
    if (self = [super initWithCellIdentifier:cellID]) {
       
        self.bgimageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.bgimageView];

        self.backgroundColor = getColor(@"1a1a1a");
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.bgimageView.frame = CGRectMake(20, 10, self.frame.size.width-40, self.frame.size.height-10);
    
}

-(void)setModel:(NSDictionary *)model{
    _model = model;
   self.bgimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.model]];
}

@end
