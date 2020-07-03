//
//  GithubApiClientTests.m
//  GithubApiClientTests
//
//  Created by Mohamed Matloub on 7/3/20.
//  Copyright © 2020 Matloub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GithubApiRepoWorker.h"
@interface GithubApiRepoWorker (Testing)
-(NSArray<GithubRepo *>*)getReposFrom:(NSArray*) fetchedArr;

@end

@interface GithubApiClientTests : XCTestCase

@end

@implementation GithubApiClientTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGetUserRepos_hasRepos {
    GithubApiRepoWorker *worker = [[GithubApiRepoWorker alloc] init];
    XCTestExpectation* expectation = [self expectationWithDescription: @"testingWorker"];
    
    NSMutableArray<GithubRepo *> * fetchedRepos = [NSMutableArray new];
    [worker getUserRepos:@"Alamofire" success:^(NSArray<GithubRepo *> * repos) {
        [fetchedRepos addObjectsFromArray:repos];
        [expectation fulfill];
    } failure:^(NSError * error) {
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
    XCTAssertEqual(fetchedRepos.count, 6);
}


- (void)testGetUserRepos_hasNoRepos {
    GithubApiRepoWorker *worker = [[GithubApiRepoWorker alloc] init];
    XCTestExpectation* expectation = [self expectationWithDescription: @"testingWorker"];
    
    NSMutableArray<GithubRepo *> * fetchedRepos = [NSMutableArray new];
    [worker getUserRepos:@"MohamedMatloub" success:^(NSArray<GithubRepo *> * repos) {
        [fetchedRepos addObjectsFromArray:repos];
        [expectation fulfill];
    } failure:^(NSError * error) {
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
    XCTAssertEqual(fetchedRepos.count, 0);
}

- (void)testGetReposFromResponse {
    NSMutableDictionary *dict = [NSMutableDictionary new];
     
     [dict setValue:@"Repo" forKey:@"name"];
     [dict setValue:@"User/Repo" forKey:@"full_name"];
     [dict setValue:@"some description" forKey:@"description"];
     [dict setValue:@"1" forKey:@"stargazers_count"];
     [dict setValue:@"1" forKey:@"watchers_count"];
     [dict setValue:@"Swift" forKey:@"language"];
     [dict setValue:@"1" forKey:@"forks_count"];
     
    NSArray *array = [[NSArray alloc] initWithObjects:dict, nil];
    GithubApiRepoWorker *worker = [[GithubApiRepoWorker alloc] init];
    NSArray *repos = [worker getReposFrom:array];
    
    XCTAssertEqual(repos.count, 1);
    GithubRepo *repo = repos.firstObject;
    XCTAssertEqual(repo.name, @"Repo");
}

@end
