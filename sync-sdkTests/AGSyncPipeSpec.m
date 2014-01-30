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
#import "OHHTTPStubs.h"
#import "OHHTTPStubsResponse.h"


//#import "AGSyncPipe.h"

SPEC_BEGIN(AGSyncPipeSpec)


describe(@"AGDeviceRegistration", ^{
    
    context(@"when created.....", ^{
        
        //__block AGSyncPipe *syncPipe;

        beforeAll(^{
            
            // install the mock:
//            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
//                return YES;
//            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
//                return [OHHTTPStubsResponse responseWithData:[NSData data]
//                                                  statusCode:200
//                                                responseTime:0 // immediate response
//                                                     headers:@{@"Content-Type":@"text/json]"}];
//            }];
//            
//            
//            registration = [[AGDeviceRegistration alloc]
//                            initWithServerURL:[NSURL URLWithString:@"http://localhost:8080/ag-sync/"]];
            
        });
        
        it(@"shared instance should not be nil", ^{
            
//            [[AGDeviceRegistration sharedInstance] shouldNotBeNil];
        });
        
        it(@"failure block should be invoked with an NSError object if configuration block is not set", ^{
           
//            [registration registerWithClientInfo:nil success:^() {
//                // nope...
//            } failure:^(NSError *error) {
//                [error shouldNotBeNil];
//            }
//             ];
        });
        
    });
});

SPEC_END