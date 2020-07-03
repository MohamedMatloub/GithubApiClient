//
//  GithubApiClient.m
//  GithubApiClient
//
//  Created by Mohamed Matloub on 7/2/20.
//

#import "GithubApiRepoWorker.h"
#import "GithubRepo.h"
#import "GitHubApiClientError.h"

#import <AFNetworking/AFNetworking.h>

@interface GithubApiRepoWorker ()
@property (unsafe_unretained) Class afNetworkManagerClass;
@end

@implementation GithubApiRepoWorker

/// Search for repositories on github for a user
/// @param username github username to search for
/// @param success return array of repos for the sepicified user
/// @param failure return failure error in case of AFNetworking not found will return error code GitHubApiClientErrorAFNetworkingNotFound, otherwise api call error
-(void)getUserRepos:(NSString *)username
            success:(nullable void (^)(NSArray<GithubRepo *> * _Nonnull))success
            failure:(nullable void (^)(NSError * _Nonnull))failure {
    
    if (NSClassFromString(@"AFHTTPSessionManager")) {
        [self getRepos:username success:success failure:failure];
    } else {
        NSLog(@"Failed to find AFNetworking, plesae make sure you added AFNetworking as a dependancy by adding \n pod 'GithubApiClient/Networking'\n in your pod file");
        [NSError errorWithDomain:@"GithubApiClient" code:GitHubApiClientErrorAFNetworkingNotFound userInfo:nil];
    }
}

-(void) getRepos:(NSString *)username
         success: (nullable void (^)(NSArray<GithubRepo *> * _Nonnull))success
         failure:(nullable void (^)(NSError * _Nonnull))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];    
    NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    
    [manager GET: url parameters:nil headers: nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *fetchedArr = responseObject;
        NSArray<GithubRepo *> *repos = [self getReposFrom: fetchedArr];
        success(repos);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

-(NSArray<GithubRepo *>*)getReposFrom:(NSArray*) fetchedArr {
    NSMutableArray<GithubRepo *> *repos = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in fetchedArr) {
        GithubRepo *repo = [[GithubRepo alloc]initWithDictionary:dict];
        [repos addObject:repo];
    }
    return repos;
}

@end
