//
//  JJTMovie.h
//  MovieSearch_ObjC
//
//  Created by John Tate on 9/14/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJTMovie : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSNumber *rating;
@property (nonatomic, readonly, copy) NSString *summary;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
