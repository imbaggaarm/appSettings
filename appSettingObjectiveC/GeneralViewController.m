//
//  GeneralViewController.m
//  appSettingObjectiveC
//
//  Created by Dung Duong on 12/4/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "GeneralViewController.h"

@interface GeneralViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@end

@implementation GeneralViewController
{
    NSString *cellID;
    NSMutableArray *cellData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"General";
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    cellID = @"cellID";
    
    cellData = [[NSMutableArray alloc] init];
    NSArray *arrSec0 = @[@"About"];
    NSArray *arrSec1 = @[@"Accessibility"];
    NSArray *arrSec2 = @[@"Keyboard", @"Language & Region", @"Dictionary"];
    NSArray *arrSec3 = @[@"Reset"];
    
    [cellData addObject:arrSec0];
    [cellData addObject:arrSec1];
    [cellData addObject:arrSec2];
    [cellData addObject:arrSec3];
    
    [self setUpViews];
}
- (void)setUpViews
{
    [self setUpTableView];
}
- (void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cellData[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [[cellData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

@end
