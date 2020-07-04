//
//  MMViewController.m
//  GithubApiClient
//
//  Created by MohamedMatloub on 07/02/2020.
//  Copyright (c) 2020 MohamedMatloub. All rights reserved.
//

#import "MMViewController.h"
#import "MMRepoTableViewCell.h"
@import GithubApiClient;

@interface MMViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *emptyView;
@property (weak, nonatomic) IBOutlet UILabel *emptyMessageLabel;


@property NSArray<GithubRepo *> *datasource;
@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.emptyView setHidden:false];
    self.emptyMessageLabel.text = @"";
    
    [self setupTableView];
    [self setupSearchBar];
    
}

-(void) setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
}

-(void)searchReposWith:(NSString *)userName {
    [[[GithubApiRepoWorker alloc]init] getUserRepos:userName
                                        success:^(NSArray<GithubRepo *> * repos) {
        self.datasource = repos;
        [self.tableView reloadData];
        if ([repos count] > 0 ){
            [self.emptyView setHidden:true];
        } else {
            [self.emptyView setHidden:false];
            self.emptyMessageLabel.text = @"Looks like this user has no public repos, try searching for another one";
        }
        
    } failure:^(NSError * error) {
        self.datasource = [NSArray new];
        [self.tableView reloadData];
        switch ([error code]) {
            case GitHubApiClientErrorAFNetworkingNotFound:
                [self.emptyView setHidden:false];
                self.emptyMessageLabel.text = @"Something went wrong while searching, we are working on solving it right now, please try again in a bit";
                break;
                
            default:
                [self.emptyView setHidden:false];
                self.emptyMessageLabel.text = @"looks like this user couldn't be found, try searching for another one";
                
                break;
        }
    }];
}

-(void) setupSearchBar {
    self.searchbar.delegate = self;
    self.searchbar.placeholder = @"Github UserName";
}

#pragma mark TableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MMRepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"
                                                            forIndexPath: indexPath];
    GithubRepo *repo = self.datasource[indexPath.row];
    [cell updateDataWith:repo];
    return cell;
}
#pragma mark TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}
#pragma mark SearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    if (searchBar.text) {
        [self searchReposWith: searchBar.text];
    }
}
@end
