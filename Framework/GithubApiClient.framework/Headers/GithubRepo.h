//
//  GithubRepo.h
//  GithubApiClient
//
//  Created by Mohamed Matloub on 7/2/20.
//

#import <Foundation/Foundation.h>

@interface GithubRepo : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *fullName;
@property (nonatomic) NSString *repoDescription;
@property (nonatomic) NSString *starCount;
@property (nonatomic) NSString *watchersCount;
@property (nonatomic) NSString *language;
@property (nonatomic) NSString *forksCount;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end

