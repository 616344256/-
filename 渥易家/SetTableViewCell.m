//
//  SetTableViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

//
//  SetTableViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "SetTableViewCell.h"

@interface SetTableViewCell()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *label;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation SetTableViewCell

-(id)initWithCellIdentifier:(NSString *)cellID{

    if (self = [super initWithCellIdentifier:cellID]) {
        self.backgroundColor = getColor(@"1a1a1a");
        
        self.bgView = [[UIView alloc]init];
        [self.contentView addSubview:self.bgView];
        
        self.imgView = [[UIImageView alloc]init];
        [self.bgView addSubview:self.imgView];
        
        self.label = [[UILabel alloc]init];
        [self.bgView addSubview:self.label];
        
    }
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.bgView.frame = CGRectMake(30, 10, self.frame.size.width - 60, self.frame.size.height - 20);
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 10;
    
    self.bgView.backgroundColor = getColor(@"3c3c3c");
    
    self.imgView.frame = CGRectMake(self.bgView.frame.size.width - 20,13,9,15);
    self.imgView.image = [UIImage imageNamed:@"set"];
    
    self.label.frame = CGRectMake(20, 10, self.bgView.frame.size.width, 20);
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.textColor = getColor(@"80aa1f");
    self.label.font = DEF_FontSize_16;
    
    
   
}

-(void)setModel:(NSString *)model{
    _model = model;
    self.label.text = [NSString stringWithFormat:@"%@",self.model];
    
}

@end
