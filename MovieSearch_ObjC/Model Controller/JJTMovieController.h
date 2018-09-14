//
//  JJTMovieController.h
//  MovieSearch_ObjC
//
//  Created by John Tate on 9/14/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJTMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJTMovieController : NSObject

+(void)fetchMovies:(NSString *)searchTerm withBlock:(void (^ _Nullable)(NSArray<JJTMovie *> *_Nullable movies))block;

// shared instance
+ (JJTMovieController *)shared;

@end

NS_ASSUME_NONNULL_END
