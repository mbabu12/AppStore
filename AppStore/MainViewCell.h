//
//  MainViewCell.h
//  AppStore
//
//  Created by NextepMac on 4/20/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (void)addPictures;

@end
