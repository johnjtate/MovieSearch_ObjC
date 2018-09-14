//
//  JJTMovie.m
//  MovieSearch_ObjC
//
//  Created by John Tate on 9/14/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTMovie.h"

@implementation JJTMovie

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {

    self = [super init];
    if (self) {
        _title = dictionary[@"original_title"];
        _rating = dictionary[@"vote_average"];
        _summary = dictionary[@"overview"];
    }
    return self;
}

@end


