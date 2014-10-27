//
//  ViewController.m
//  ParseExample
//
//  Created by Taylor Wright-Sanson on 10/27/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell"];
    return cell;
}

- (IBAction)onAddPersonButtonPressed:(id)sender
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
