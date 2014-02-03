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
#import "AGSyncMetaDataImpl.h"

@implementation AGSyncPipe {
    AGSyncPipeConfiguration* _config;
    //id<AGSyncMetaData> _metaData;
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

- (void)read:(id)value success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    AGSyncMetaDataImpl* metaValue = [AGSyncMetaDataImpl wrapContent:value];
    [_restPipe read:[metaValue serialize] success:success failure:failure];
}

- (void)readWithParams:(NSDictionary *)parameterProvider success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    [_restPipe readWithParams:parameterProvider success:success failure:failure];
}

- (void)save:(id<AGSyncMetaData>)object success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure conflict:(void (^)(NSError *error, id responseObject, id delta))conflict {
    [_restPipe save:object success:success failure:^(NSError *error) {
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
