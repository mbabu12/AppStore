//
//  ViewController.m
//  AppStore
//
//  Created by NextepMac on 4/20/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import "ViewController.h"
#import "MainViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    first = NO;
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] init];
    [anotherButton setTitle:@"Categories"];
    [anotherButton setTarget:self];
    [anotherButton setAction:@selector(showCat:)];
    self.navigationItem.leftBarButtonItem = anotherButton;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
 
    self.scrollPage = [[ScrollPaging alloc] initWithFrame:CGRectMake(-self.view.bounds.size.width, 64, self.view.bounds.size.width * 3, 110)];
    [self.scrollPage addPictures];
    [self.view addSubview:self.scrollPage];
}

- (void)viewWillAppear:(BOOL)animated{
    if(first){
        [self.scrollPage setTimer];
    }
    first = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.scrollPage.timer invalidate];
}

- (IBAction)showCat:(id)sender
{
    // code here
    [self performSegueWithIdentifier:@"show_cat" sender:nil];
}

- (IBAction)SeeAll:(id)sender {
    [self performSegueWithIdentifier:@"show_table" sender:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MainViewCell";
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    [cell addPictures];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
