/*
 * JBoss, Home of Professional Open Source.
 * Copyright Red Hat, Inc., and individual contributors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "AGSyncPipe.h"
#import "AGRESTPipe.h"
#import "AGSyncPipeConfiguration.h"
#import "AGSyncMetaData.h"
#import "AGSyncMetaData.h"


@implementation AGSyncPipe {
    AGSyncPipeConfiguration* _config;
}

@synthesize type = _type;
@synthesize URL = _URL;

+ (id)pipeWithConfig:(id <AGPipeConfig>)pipeConfig {
    return [[self alloc] initWithConfig:pipeConfig];
}

- (id)initWithConfig:(id <AGPipeConfig>)config {
    self = [super init];
    if (self) {
        _config = (AGSyncPipeConfiguration *)config;
        _type = _config.type;
        NSURL* baseURL = _config.baseURL;
        NSString* endpoint = _config.endpoint;
        NSURL* finalURL = [self appendEndpoint:endpoint toURL:baseURL];
        _URL = finalURL;
        _restPipe = [AGRESTPipe pipeWithConfig:_config];
    }

    return self;
}


- (void)read:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    [_restPipe read:success failure:failure];
}

- (void)read:(id<AGSyncMetaData>)value success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    //AGSyncMetaData* metaValue = [AGSyncMetaData wrapContent:value];
    [_restPipe read:value.oid success:^(id responseObject) {
        // not needed if rest point
        NSDictionary *contentDict = [NSJSONSerialization JSONObjectWithData:[responseObject[@"content"]  dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        NSDictionary* dict = @{@"id":responseObject[@"id"], @"rev":responseObject[@"rev"], @"content":contentDict};
        if (success) {
            success(dict);
        }
    } failure:^(NSError *error) {
        if(failure) {
            failure(error);
        }
    } ];
}

- (void)readWithParams:(NSDictionary *)parameterProvider success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    [_restPipe readWithParams:parameterProvider success:success failure:failure];
}

- (void)save:(id<AGSyncMetaData>)object success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure conflict:(void (^)(NSError *error, id responseObject, id delta))conflict {
    //AGSyncMetaData* metaValue = [AGSyncMetaData wrapContent:object];
    NSDictionary* temp = [AGSyncMetaData serialize:object];
    [_restPipe save:temp success:^(id responseObject) {
        NSLog(@"Inside Success");
        // not needed if rest point
        NSDictionary *contentDict = [NSJSONSerialization JSONObjectWithData:[responseObject[@"content"]  dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        NSDictionary* dict = @{@"id":responseObject[@"id"], @"rev":responseObject[@"rev"], @"content":contentDict};
        if (success) {
            success(dict);
        }
    } failure:^(NSError *error) {
        NSLog(@"Inside Failure....");
        //conflict(error, responseObject);
        if (error) {

        }
    }];

}

- (void)remove:(NSDictionary *)object success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    [_restPipe remove:object success:success failure:failure];

}

// TODO same as AGRESTPipe
// private helper to append the endpoint
-(NSURL*) appendEndpoint:(NSString*)endpoint toURL:(NSURL*)baseURL {
    if (endpoint == nil) {
        endpoint = @"";
    }

    // append the endpoint name and use it as the final URL
    return [baseURL URLByAppendingPathComponent:endpoint];
}

@end
