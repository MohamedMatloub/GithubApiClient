//
//  MMRepoTableViewCell.m
//  GithubApiClient_Example
//
//  Created by Mohamed Matloub on 7/3/20.
//  Copyright © 2020 MohamedMatloub. All rights reserved.
//

#import "MMRepoTableViewCell.h"
@interface MMRepoTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *forkLabel;
@property (weak, nonatomic) IBOutlet UILabel *starsLabel;
@end

@implementation MMRepoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void) updateDataWith:(GithubRepo *) repo {
    self.titleLabel.text = repo.name;
    if (![repo.repoDescription isEqual:[NSNull null]]) {
        self.descriptionLabel.text = repo.repoDescription;
    } else {
        self.descriptionLabel.text = @"";
    }
   
    if (![repo.language isEqual:[NSNull null]]) {
          self.languageLabel.text = [NSString stringWithFormat: @"Language: %@", repo.language];
      } else {
          self.languageLabel.text = @"";
      }
    
    if (![repo.forksCount isEqual:[NSNull null]]) {
          self.forkLabel.text = [NSString stringWithFormat: @"Forks: %@", repo.forksCount];
      } else {
          self.forkLabel.text = @"";
      }
    
    if (![repo.starCount isEqual:[NSNull null]]) {
          self.starsLabel.text = [NSString stringWithFormat: @"Stars: %@", repo.starCount];
      } else {
          self.starsLabel.text = @"";
      }
}
@end
