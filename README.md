# GithubApiClient

GithubApiClient is an example for using Github V3 api.

## Installation
CocoaPods

CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate into your Xcode project using CocoaPods, specify it in your Podfile:

```
pod 'GithubApiClient', '1.0.1'
```
GithubApiClient depends optionally on `AFnetworking`, to integrate it with `AFnetworking` add this to your podfile

```
pod 'GithubApiClient/Networking'
```

## Usage

to use GithubApiClient you can start by calling it in your app by passing `username` which is github username with array of repos as a success callback like in the following code

```
    [[[GithubApiRepoWorker alloc]init] getUserRepos:userName
                                        success:^(NSArray<GithubRepo *> * repos) {
    } failure:^(NSError * error) {
    }];
```

in case of `AFnetworking` not found then the previous method will return error with error code `GitHubApiClientErrorAFNetworkingNotFound`
