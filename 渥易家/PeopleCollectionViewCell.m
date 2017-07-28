//
//  PeopleCollectionViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "PeopleCollectionViewCell.h"

#import "UIImageView+WebCache.h"
#import "Config.h"

@interface PeopleCollectionViewCell()

@property(nonatomic,strong)UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation PeopleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = getColor(@"262626");
        
        self.imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.label];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(15, self.frame.size.height - self.frame.size.width + 15, self.frame.size.width - 30, self.frame.size.width - 30);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.label.frame = CGRectMake(0, 15, self.frame.size.width, 20);
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = getColor(@"80aa1f");
    self.label.font = DEF_FontSize_14;
    self.label.text = @"盟科视界";
    
    self.imageView.image = [UIImage imageNamed:@"人框"];
}

-(void)setModel:(NSDictionary *)model{
    
    
}

@end
