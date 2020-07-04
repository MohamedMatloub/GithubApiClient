//
//  MMRepoTableViewCell.h
//  GithubApiClient_Example
//
//  Created by Mohamed Matloub on 7/3/20.
//  Copyright © 2020 MohamedMatloub. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GithubApiClient;

@interface MMRepoTableViewCell : UITableViewCell
-(void) updateDataWith:(GithubRepo *) repo;
@end

