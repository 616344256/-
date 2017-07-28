//
//  ClassifyCollectionViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "ClassifyCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Config.h"

@interface ClassifyCollectionViewCell()
@property(nonatomic,strong)UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation ClassifyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = getColor(@"262626");
        
        self.bgImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.bgImageView];
        
        self.imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.label];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.bgImageView.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20);

    self.label.frame = CGRectMake(0, self.frame.size.height/2 + 20, self.frame.size.width, 20);
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = getColor(@"C2C2C2");
    self.label.font = DEF_FontSize_18;
    self.label.text = @"麦当劳";
    
    
    self.imageView.frame = CGRectMake(self.frame.size.width/2 - 11, self.frame.size.height/2 - 25, 20, 30);
    self.imageView.image = [UIImage imageNamed:@"话筒"];
    
    
}

-(void)setModel:(NSString *)model{
    
    _model= model;
    
    self.bgImageView.image = [UIImage imageNamed:model];
}

@end
