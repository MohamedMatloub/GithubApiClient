//
//  GithubRepo.m
//  GithubApiClient
//
//  Created by Mohamed Matloub on 7/2/20.
//

#import "GithubRepo.h"
#import <Foundation/Foundation.h>
@implementation GithubRepo

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _name = [dictionary objectForKey: @"name"];
        _fullName = [dictionary objectForKey: @"full_name"];
        _repoDescription = [dictionary objectForKey: @"description"];
        _starCount = [dictionary objectForKey: @"stargazers_count"];
        _watchersCount = [dictionary objectForKey: @"watchers_count"];
        _language = [dictionary objectForKey: @"language"];
        _forksCount = [dictionary objectForKey: @"forks_count"];
    }
    return self;
}
@end
