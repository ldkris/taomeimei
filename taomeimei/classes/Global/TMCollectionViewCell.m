//
//  TMCollectionViewCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMCollectionViewCell.h"

@implementation TMCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
       // [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return self;
}

@end
