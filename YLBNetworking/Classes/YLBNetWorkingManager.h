//
//  YLBNetWorkingManager.h
//  YLBNetworking_Example
//
//  Created by yulibo on 2020/3/30.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBNetWorkingManager : NSObject

+ (instancetype)sharedInstance;

- (void)post:(NSString *)urlString
  parameters:(id)parameters
     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

- (void)get:(NSString *)urlString
 parameters:(id)parameters
    success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
    failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

@end

NS_ASSUME_NONNULL_END
