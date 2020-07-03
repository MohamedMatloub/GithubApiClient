
//
//  GithubApiRepoWorker.h
//  GithubApiRepoWorker
//
//  Created by Mohamed Matloub on 7/2/20.
//

@import Foundation;
#import "GithubRepo.h"

@interface GithubApiRepoWorker : NSObject

-(void)getUserRepos:(NSString * _Nonnull)username
            success:(nullable void (^)(NSArray<GithubRepo *> * _Nonnull))success
            failure:(nullable void (^)(NSError * _Nonnull))failure;
@end
