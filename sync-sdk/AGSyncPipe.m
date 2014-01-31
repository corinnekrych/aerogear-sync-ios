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

@implementation AGSyncPipe
+ (id)pipeWithConfig:(id <AGPipeConfig>)pipeConfig {
    return nil;
}

- (id)initWithConfig:(id <AGPipeConfig>)pipeConfig {
    return nil;
}

- (NSString *)type {
    return nil;
}

- (NSURL *)URL {
    return nil;
}

- (void)read:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
    conflict: (void (^)(NSError *error, id responseObject)){

}

- (void)read:(id)value success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {

}

- (void)readWithParams:(NSDictionary *)parameterProvider success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {

}

- (void)save:(NSDictionary *)object success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {

}

- (void)remove:(NSDictionary *)object success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {

}

- (void)cancel {

}

- (void)setUploadProgressBlock:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))block {

}


@end
