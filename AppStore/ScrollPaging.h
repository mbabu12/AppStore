//
//  ScrollPaging.h
//  AppStore
//
//  Created by NextepMac on 4/21/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollPaging : UIView{
    NSMutableArray * arr;
}

- (void)addPictures;
- (id)initWithFrame:(CGRect)frame;
- (void)setTimer;

@property (strong, nonatomic) UISwipeGestureRecognizer * swipeleft;
@property (strong, nonatomic) UISwipeGestureRecognizer * swiperight;

@property (strong, nonatomic) NSTimer * timer;

@end
