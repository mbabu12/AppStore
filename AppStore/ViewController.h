//
//  ViewController.h
//  AppStore
//
//  Created by NextepMac on 4/20/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavigationController.h"
#import "ScrollPaging.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    BOOL first;
}

@property (strong, nonatomic) ScrollPaging *scrollPage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

