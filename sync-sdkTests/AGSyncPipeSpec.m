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

#import <Kiwi/Kiwi.h>
#import "AGSyncPipe.h"
#import "AGSyncPipeConfiguration.h"
#import "AGHTTPMockHelper.h"

SPEC_BEGIN(AGPipelineSpec)

describe(@"AGSyncPipe", ^{
    context(@"when newly created", ^{

        __block NSString *PROJECTS = nil;
        __block AGSyncPipe *pipe = nil;
        __block BOOL finishedFlag;

        beforeAll(^{
            PROJECTS = @"[{\"oid\":1,\"rev\":1, \"content\": {\"title\":\"First Project\",\"style\":\"project-161-58-58\"}}]";
        });

        beforeEach(^{

            AGSyncPipeConfiguration* config = [[AGSyncPipeConfiguration alloc] init];
            [config setBaseURL:[NSURL URLWithString:@"http://server.com"]];
            [config setName:@"projects"];

            // Note: we set the timeout(sec) to a low level so that
            // we can test the timeout methods with adjusting response delay
            [config setTimeout:1];

            pipe = [AGSyncPipe pipeWithConfig:config];
        });

        afterEach(^{
            // remove all handlers installed by test methods
            // to avoid any interference
            [AGHTTPMockHelper clearAllMockedRequests];

            finishedFlag = NO;
        });
        
        it(@"should not be nil", ^{
            [pipe shouldNotBeNil];
        });
        
        it(@"can be added to pipeline", ^{
//            [pipeline add:pipe ];
//            
//            id<AGPipe> pipe = [pipeline pipeWithName:@"tests"];
//            
//            [(id)pipe shouldNotBeNil];
//            [[pipe.type should] equal:@"REST"];
        });
        
        it(@"AGPipeline should allow add of an AGPipe object with a different baseURL", ^{
            
//            [pipeline pipe:^(id<AGPipeConfig> config) {
//                [config setName:@"tasks"];
//                [config setBaseURL:[NSURL URLWithString:@"http://blah.com/context"]];
//            }];
//            
//            id<AGPipe> pipe = [pipeline pipeWithName:@"tasks"];
//            [pipe.URL shouldNotBeNil];
//            [[pipe.URL should] equal:[NSURL URLWithString:@"http://blah.com/context/tasks"]];
        });

        it(@"should have an expected url", ^{
            [[pipe.URL should] equal:[NSURL URLWithString:@"http://server.com/projects"]];
        });

        it(@"should have an expected type", ^{
            [[pipe.type should] equal:@"SYNC"];
        });

        it(@"should successfully read", ^{
            // install the mock:
            [AGHTTPMockHelper mockResponse:[PROJECTS dataUsingEncoding:NSUTF8StringEncoding]];

            [pipe read:^(id responseObject) {
                [responseObject shouldNotBeNil];
                finishedFlag = YES;

            } failure:^(NSError *error) {
                // nope
            }];

            [[expectFutureValue(theValue(finishedFlag)) shouldEventually] beYes];
        });
    });
});

SPEC_END