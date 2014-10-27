//
//  ViewController.m
//  ParseExample
//
//  Created by Taylor Wright-Sanson on 10/27/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "PersonViewController.h"
#import <Parse/Parse.h>

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
    PFObject *person = [PFObject objectWithClassName:@"Person"];
    person[@"name"] = @"Johnny Appleseed";
    // Make sure to store int as an NSNumber object.
    person[@"age"] = @22;

    [person saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error.userInfo);
        }
        else {
            [self refreshDisplay];
        }
    }];
}

- (void)refreshDisplay
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
