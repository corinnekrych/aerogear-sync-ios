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
#import "AGSyncMetaData.h"


@implementation AGSyncMetaData
@synthesize oid = _oid;
@synthesize rev = _rev;
@synthesize content = _content;

+(AGSyncMetaData*)wrapContent:(id)object {
    return [[self alloc] initWithMetaData:object];
}

-(id)initWithMetaData:(id)object {
    self = [super init];
    if(self) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            _content = object[@"content"]?object[@"content"]:[NSNull null];
            _oid = object[@"id"]?object[@"id"]:[NSNull null];
            _rev = object[@"rev"]?object[@"rev"]:[NSNull null];
        }

    }
    return self;
}

+(NSDictionary*)serialize:(AGSyncMetaData*)metadata {
    if ([metadata.rev isEqual:[NSNull null]]) {
        return @{@"id":metadata.oid?metadata.oid:[NSNull null], @"content":metadata.content?metadata.content:[NSNull null]};
    }
    return @{@"id":metadata.oid?metadata.oid:[NSNull null], @"rev":metadata.rev?metadata.rev:[NSNull null], @"content":metadata.content?metadata.content:[NSNull null]};
}


@end