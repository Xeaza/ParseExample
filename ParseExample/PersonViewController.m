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

@property NSArray *people;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshDisplay];
}

#pragma mark - Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell"];
    // self.people is filled with PFObjects
    cell.textLabel.text = [self.people objectAtIndex:indexPath.row][@"name"];
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
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error.userInfo);
            self.people = [NSArray array];
        }
        else {
            self.people = objects;
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
