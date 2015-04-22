//
//  ScrollPaging.m
//  AppStore
//
//  Created by NextepMac on 4/21/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import "ScrollPaging.h"

@implementation ScrollPaging

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit{
    arr = [[NSMutableArray alloc] init];
    
    self.swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    self.swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:self.swipeleft];
    
    
    self.swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    self.swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:self.swiperight];

}

- (void)setTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(startAnimation:) userInfo:nil repeats:YES];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [self showPrev];
    [self.timer invalidate];
    self.timer = nil;
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [self showNext];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)addPictures{
    [self setTimer];
    for(int i = 0; i < 3; i++){
        UIImageView * image = [[UIImageView alloc] init];
        if(i == 0)
            image.backgroundColor = [UIColor redColor];
        else if(i == 1)
            image.backgroundColor = [UIColor greenColor];
        else
            image.backgroundColor = [UIColor blueColor];
        image.frame = CGRectMake(self.frame.size.width / 3 * i, 0, self.frame.size.width / 3, self.frame.size.height);
        [self addSubview:image];
        [arr addObject:image];
    }
}

- (void)showPrev{
    UIImageView * temp = [arr objectAtIndex:([arr count] - 1)];
    CGRect frame = temp.frame;
    frame.origin.x = - self.frame.size.width / 3;
    temp.frame = frame;
    [arr removeObjectAtIndex:([arr count] - 1)];
    [arr insertObject:temp atIndex:0];
    for(int i = 0; i < [arr count]; i++){
        UIImageView * next = [arr objectAtIndex:i];
        CGRect imageFrame = next.frame;
        imageFrame.origin.x += imageFrame.size.width;
        [UIView animateWithDuration:0.5
                              delay:0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             next.frame = imageFrame;
                         }
                         completion:^(BOOL finished){
                             if(self.timer == nil)
                                 [self setTimer];
                         }];
    }

}

- (void)showNext{
    UIImageView * temp = [arr objectAtIndex:0];
    CGRect frame = temp.frame;
    frame.origin.x = self.frame.size.width;
    temp.frame = frame;
    [arr removeObjectAtIndex:0];
    [arr addObject:temp];
    for(int i = 0; i < [arr count]; i++){
        UIImageView * next = [arr objectAtIndex:i];
        CGRect imageFrame = next.frame;
        imageFrame.origin.x -= imageFrame.size.width;
        self.userInteractionEnabled = NO;
        [UIView animateWithDuration:0.5
                              delay:0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                                  next.frame = imageFrame;
                         }
                         completion:^(BOOL finished){
                             self.userInteractionEnabled = YES;
                             if(self.timer == nil)
                                 [self setTimer];
                         }];
    }
}

- (void)startAnimation:(NSTimer *)theTimer{
    [self showNext];
    
}


@end
