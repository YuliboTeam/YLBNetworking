//
//  YLBNetWorkingManager.m
//  YLBNetworking_Example
//
//  Created by yulibo on 2020/3/30.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBNetWorkingManager.h"

@interface YLBNetWorkingManager ()
@property(nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation YLBNetWorkingManager

+ (AFHTTPSessionManager *)sharedManager {
    //防止内存泄漏
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 15.0f;
        NSSet <NSString *> *acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"application/octet-stream", @"application/x-javascript", @"text/html", @"text/json", @"text/javascript", @"text/plain", nil];
        manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
        
    });
    
    return manager;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YLBNetWorkingManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}
//拦截外部调用alloc方法创建单例实例
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (void)post:(NSString *)urlString
  parameters:(id)parameters
     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    [[YLBNetWorkingManager sharedManager] POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)get:(NSString *)urlString
 parameters:(id)parameters
    success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
    failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure {
    [[YLBNetWorkingManager sharedManager] GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}
@end
