//
//  MainViewCell.m
//  AppStore
//
//  Created by NextepMac on 4/20/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import "MainViewCell.h"

@implementation MainViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)addPictures{
    int x = 10;
    int width = 80;
    for(int i = 0; i < 5; i++){
        UIImageView * image = [[UIImageView alloc] init];
        image.frame = CGRectMake(x*(i + 1) + i * width, 0, width, width);
        image.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:image];
        UILabel * label = [[UILabel alloc] init];
        [label setText:@"Game"];
        label.frame = CGRectMake(x*(i + 1) + i * width, width + 5, width, 15);
        [self.scrollView addSubview:label];
                                 
    }
    self.scrollView.contentSize = CGSizeMake(5*(x + width) + x, self.scrollView.frame.size.height);
}

@end
