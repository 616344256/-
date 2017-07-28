//
//  SaftTableViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "SaftTableViewCell.h"

@interface SaftTableViewCell()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *label;
@property (nonatomic, strong) UIImageView *imgView;
@property(nonatomic,strong)UILabel *phoneLabel;

@end

@implementation SaftTableViewCell

-(id)initWithCellIdentifier:(NSString *)cellID{
    
    if (self = [super initWithCellIdentifier:cellID]) {
        self.backgroundColor = getColor(@"1a1a1a");
        
        self.bgView = [[UIView alloc]init];
        [self.contentView addSubview:self.bgView];
        
        self.imgView = [[UIImageView alloc]init];
        [self.bgView addSubview:self.imgView];
        
        self.label = [[UILabel alloc]init];
        [self.bgView addSubview:self.label];
        
        self.phoneLabel = [[UILabel alloc]init];
        [self.bgView addSubview:self.phoneLabel];
        
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
    
    
    self.phoneLabel.frame = CGRectMake(20, 10, self.bgView.frame.size.width-50, 20);
    self.phoneLabel.textAlignment = NSTextAlignmentRight;
    self.phoneLabel.textColor = getColor(@"1a1a1a");
    self.phoneLabel.font = DEF_FontSize_16;
    
    
    
}

-(void)setModel:(NSString *)model{
    _model = model;
    self.label.text = [NSString stringWithFormat:@"%@",self.model];
    if ([self.model isEqualToString:@"绑定手机"]) {
        self.phoneLabel.hidden = NO;
        self.phoneLabel.text = @"18304076096";
    }else{
        
        self.phoneLabel.hidden = YES;
    }
}

@end
