//
//  ViewController.m
//  appSettingObjectiveC
//
//  Created by Dung Duong on 12/4/16.
//  Copyright © 2016 Tai Duong. All rights reserved.
//

#import "ViewController.h"
#import "GeneralViewController.h"
#import "PhotoCameraViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) UITableView *tableView;

@end

@implementation ViewController
{
    NSString *cellID;
    NSMutableArray *cellData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    self.title = @"Settings";
    
    
    cellID = @"cellID";
    cellData = [[NSMutableArray alloc] init];
    
    NSMutableArray *section0 = [[NSMutableArray alloc] init];
    NSDictionary *cellDic00 = @{@"name": @"General", @"imageName": @"General.png"};
    NSDictionary *cellDic01 = @{@"name": @"Privacy", @"imageName": @"Privacy.png"};
    [section0 addObject:cellDic00];
    [section0 addObject:cellDic01];
    
    NSMutableArray *section1 = [[NSMutableArray alloc] init];
    NSDictionary *cellDic10 = @{@"name": @"iCloud", @"imageName": @"iCloud.png"};
    NSDictionary *cellDic11 = @{@"name": @"Maps", @"imageName": @"Maps.png"};
    NSDictionary *cellDic12 = @{@"name": @"Safari", @"imageName": @"Safari.png"};
    NSDictionary *cellDic13 = @{@"name": @"News", @"imageName": @"News.png"};
    NSDictionary *cellDic14 = @{@"name": @"Photo & Camera", @"imageName": @"Photo.png"};
    NSDictionary *cellDic15 = @{@"name": @"Game Center", @"imageName": @"GameCenter.png"};
    [section1 addObject:cellDic10];
    [section1 addObject:cellDic11];
    [section1 addObject:cellDic12];
    [section1 addObject:cellDic13];
    [section1 addObject:cellDic14];
    [section1 addObject:cellDic15];
    
    
    NSMutableArray *section2 = [[NSMutableArray alloc] init];
    NSDictionary *cellDic20 = @{@"name": @"Twitter", @"imageName": @"Twitter.png"};
    NSDictionary *cellDic21 = @{@"name": @"Facebook", @"imageName": @"Facebook.png"};
    NSDictionary *cellDic22 = @{@"name": @"Flickr", @"imageName": @"Flickr.png"};
    NSDictionary *cellDic23 = @{@"name": @"Vimeo", @"imageName": @"Vimeo.png"};
    [section2 addObject:cellDic20];
    [section2 addObject:cellDic21];
    [section2 addObject:cellDic22];
    [section2 addObject:cellDic23];
    
    
    NSMutableArray *section3 = [[NSMutableArray alloc] init];
    NSDictionary *cellDic30 = @{@"name": @"Developer", @"imageName": @"Developer.png"};
    [section3 addObject:cellDic30];
    
    [cellData addObject:section0];
    [cellData addObject:section1];
    [cellData addObject:section2];
    [cellData addObject:section3];
    
    
    [self setUpViews];

}

-(void) setUpViews
{
    [self setUpTableView];
}

-(void) setUpTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview: self.tableView];
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
    cell.backgroundColor = [UIColor whiteColor];
    NSDictionary *temp = [[cellData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed: [temp objectForKey:@"imageName"]];
    cell.imageView.layer.cornerRadius = 10;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.textLabel.text = [temp objectForKey:@"name"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            [self showViewController:[[GeneralViewController alloc] init] sender:nil];
        }
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 4)
        {
            [self showViewController:[[PhotoCameraViewController alloc] init] sender:nil];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
