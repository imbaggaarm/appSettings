//
//  PhotoCameraViewController.m
//  appSettingObjectiveC
//
//  Created by Dung Duong on 12/4/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "PhotoCameraViewController.h"

@interface PhotoCameraViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@end

@implementation PhotoCameraViewController
{
    NSString *cellID;
    //NSArray *arrOfUserDefault;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Photo & Camera";
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    cellID = @"cellID";
//    arrOfUserDefault = [[NSUserDefaults standardUserDefaults] arrayForKey:@"arrOfSwitchValue"];
//    if (arrOfUserDefault == nil)
//    {
//        arrOfUserDefault = @[@"true", @"true", @"true"];
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:arrOfUserDefault forKey:@"arrOfSwitchValue"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    NSLog(@"%li",arrOfUserDefault.count);
    [self setUpViews];
}

-(void)setUpViews
{
    [self setUpTableView];
}
-(void)setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    UISwitch *swiForCell = [[UISwitch alloc] init];
    swiForCell.tag = indexPath.section;
    swiForCell.on = [self getValueforObjectAtIndex:indexPath.section];
    [swiForCell addTarget:self action:@selector(changeValueOfSwi:) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = swiForCell;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"Summarize Photos";
            break;
        case 1:
            
            cell.textLabel.text = @"Show Holiday Events";
            break;
        default:
            
            cell.textLabel.text = @"Grid";
            break;
    }
    return cell;
}
-(void)changeValueOfSwi: (UISwitch *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    if (sender.on) [self setObject:@"true" forObjectAtIndex:sender.tag];
    else [self setObject:@"false" forObjectAtIndex:sender.tag];
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"PHOTOS TAB";
        case 1:
            return @"MEMORIES";
        default:
            return @"CAMERA";
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    switch (section) {
        case 0:
            return @"The Photos tab shows every photo in your library in all views. You can choose compact, summarized views for Collection and Years.";
        case 1:
            return @"You can choose to see holiday events for your home country.";
        default:
            return @"";
    }
}
-(void)setObject: (NSString *)object forObjectAtIndex: (NSInteger)index
{
    NSArray *temp = [[NSUserDefaults standardUserDefaults] objectForKey: @"ArrayOfSwitchValue"];
    NSLog(@"%li", temp.count);
    NSMutableArray *temp2 = [[NSMutableArray alloc] initWithArray:temp];
    NSLog(@"%li", temp2.count);
    [temp2 replaceObjectAtIndex:index withObject:object];
    [[NSUserDefaults standardUserDefaults] setObject:temp2 forKey:@"ArrayOfSwitchValue"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(BOOL)getValueforObjectAtIndex: (NSUInteger)index
{
    NSArray *temp = [[NSUserDefaults standardUserDefaults] objectForKey:@"ArrayOfSwitchValue"];
    if (temp == nil)
    {
        temp = [[NSArray alloc] initWithObjects:@"false", @"false", @"false", nil];
        [[NSUserDefaults standardUserDefaults] setObject:temp forKey:@"ArrayOfSwitchValue"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return NO;
    }
    if ([[temp objectAtIndex:index] isEqualToString: @"true"]) return YES;
    return NO;
}
@end
