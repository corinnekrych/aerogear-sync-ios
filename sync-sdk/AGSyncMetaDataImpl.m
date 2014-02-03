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
#import "AGSyncMetaDataImpl.h"


@implementation AGSyncMetaDataImpl
@synthesize oid;
@synthesize rev;
@synthesize content;

+(id<AGSyncMetaData>)wrapContent:(id)object {
   return [[self alloc] initWithMetaData:object];
}

-(id)initWithMetaData:(id)object {
    self = [super init];
    if(self) {
        self.content = object;
    }
    return self;
}

-(NSDictionary*)serialize {
    return [[NSDictionary alloc] initWithDictionary:@{@"id":self.oid, @"rev":self.rev, @"content":self.content}];
}
@end