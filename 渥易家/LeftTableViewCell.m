//
//  LeftTableViewCell.m
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "LeftTableViewCell.h"
@interface LeftTableViewCell ()
@property(nonatomic,strong)UILabel *label;
@property (nonatomic, strong) UIImageView *photoImageView;
@property (nonatomic, strong) UIImageView *starImageView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIButton *zanBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *hideLabel;
@property (nonatomic, strong) UILabel *likedLabel;
@end

@implementation LeftTableViewCell

-(id)initWithCellIdentifier:(NSString *)cellID{

    if (self = [super initWithCellIdentifier:cellID]) {
        self.backgroundColor = getColor(@"1a1a1a");
        self.bgImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.bgImageView];
        self.photoImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.photoImageView];
        self.starImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.starImageView];
        self.label = [[UILabel alloc]init];
        [self.contentView addSubview:self.label];
        self.zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.zanBtn];
        self.likeBtn = [UIButton buttonWithType: UIButtonTypeCustom];
        [self.contentView addSubview:self.likeBtn];
        
        self.hideLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.hideLabel];
        self.likedLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.likedLabel];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.bgImageView.frame = CGRectMake(0, 60, self.frame.size.width , self.frame.size.height - 99);
    self.bgImageView.image = [UIImage imageNamed:@"xiaoqu"];
    
    self.photoImageView.frame = CGRectMake(10, 30, 20, 20);
    self.photoImageView.image = [UIImage imageNamed:@"摄像头"];
    
    self.starImageView.frame = CGRectMake(self.frame.size.width - 40, 30, 20 , 20);
    self.starImageView.image = [UIImage imageNamed:@"星星"];
    
    self.label.frame = CGRectMake(40, 30 , 200, 20);
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.textColor = getColor(@"c2c2c2");
    self.label.font = DEF_FontSize_14;
    self.label.text = @"小区入口";
    
    self.zanBtn.frame = CGRectMake(0, self.frame.size.height - 40, self.frame.size.width/2, 40);
    [self.zanBtn setBackgroundColor:getColor(@"7fa91e")];
    [self.zanBtn setTitle:@"点赞" forState:UIControlStateNormal];
    [self.zanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.zanBtn setImage:[UIImage imageNamed:@"黑赞"] forState:UIControlStateNormal];
    [self.zanBtn addTarget:self action:@selector(zanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.likeBtn.frame = CGRectMake(self.frame.size.width/2, self.frame.size.height - 40, self.frame.size.width/2, 40);
    [self.likeBtn setBackgroundColor:getColor(@"7fa91e")];
    [self.likeBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [self.likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"黑收藏"] forState:UIControlStateNormal];
    [self.likeBtn addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.hideLabel.frame = CGRectMake(SCREENWIGTH - 90, 80, 80, 30);
    self.hideLabel.text = @"实时监控";
    self.hideLabel.backgroundColor = [UIColor colorWithRed:127/255.0 green:169/255.0 blue:30/255.0 alpha:0.6];
    self.hideLabel.layer.masksToBounds = YES;
    self.hideLabel.layer.cornerRadius = 15;
    self.hideLabel.textAlignment = NSTextAlignmentCenter;
    self.hideLabel.font = DEF_FontSize_14;
    
    self.likedLabel.frame = CGRectMake(0, self.frame.size.height - 60, SCREENWIGTH, 20);
    // 添加表情
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"点赞"];
    // 设置图片大小
    attch.bounds = CGRectMake(0, 0, 10, 10);
    
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]init];
    
    [attri appendAttributedString:[[NSAttributedString alloc]initWithString:@"        " attributes:nil]];
    [attri appendAttributedString:string];
    [attri appendAttributedString:[[NSAttributedString alloc]initWithString:@"   已有223556人点赞" attributes:nil]];
    // 用label的attributedText属性来使用富文本
    self.likedLabel.attributedText = attri;
    
    self.likedLabel.textColor = [UIColor whiteColor];
    self.likedLabel.backgroundColor = [UIColor colorWithRed:127/255.0 green:169/255.0 blue:30/255.0 alpha:0.6];

    self.likedLabel.textAlignment = NSTextAlignmentLeft;
    self.likedLabel.font = DEF_FontSize_14;


}

-(void)setIndex:(NSIndexPath *)index{

    _index = index;
}

-(void)setModel:(NSDictionary *)model{
    
    
}

- (void)zanBtnClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(zanBtnwithIndex:)]) {
        [self.delegate zanBtnwithIndex:self.index];
    }
}


- (void)likeBtnClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(likeBtnwithIndex:)]) {
        [self.delegate likeBtnwithIndex:self.index];
    }
}

@end
