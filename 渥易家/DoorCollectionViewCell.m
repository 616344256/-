//
//  DoorCollectionViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "DoorCollectionViewCell.h"

#import "UIImageView+WebCache.h"
#import "Config.h"

@interface DoorCollectionViewCell()

@property(nonatomic,strong)UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation DoorCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = getColor(@"1a1a1a");
        
        self.imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView];
        
        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.label];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(20, 15, self.frame.size.width - 40, self.frame.size.width - 40);

    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.contentsScale = (self.frame.size.width - 30)/2;
    self.label.frame = CGRectMake(20, 20 + (self.frame.size.width - 30)/2 , self.frame.size.width - 40, 20);
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = getColor(@"80aa1f");
    self.label.font = DEF_FontSize_14;
    self.label.text = @"盟科视界";
    
    self.imageView.image = [UIImage imageNamed:@"门"];
}

-(void)setModel:(NSDictionary *)model{
    
    
}

@end
