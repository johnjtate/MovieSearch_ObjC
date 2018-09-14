//
//  JJTMovieController.m
//  MovieSearch_ObjC
//
//  Created by John Tate on 9/14/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTMovieController.h"

@implementation JJTMovieController

#pragma mark - Properties

+(NSURL *)baseURL {
    return [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/search/movie"];
}

+(void)fetchMovies:(NSString *)searchTerm withBlock:(void (^ _Nullable)(NSArray<JJTMovie *> *_Nullable movies))block {
    
    // 1) Construct your URL
   
    NSURL *url = [JJTMovieController baseURL];
    // By making the baseURL include appending path components of "search" and "movie" already, we just have to append query items of the API key and the search term.
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:@"api_key" value:@"32a7740d7e459ee84e78297b1fa1288c"];
    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:@"query" value:searchTerm];
    components.queryItems = [[NSArray alloc] initWithObjects:queryItem1, queryItem2, nil];
    NSURL *finishedURL = components.URL;
    
    // print out the finished URL to verify correctness
    NSLog(@"%@", finishedURL);
    
    // 2) DataTask, Serialization, completion, and resume
    [[[NSURLSession sharedSession] dataTaskWithURL:finishedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *movieDictionaries = jsonDictionary[@"results"];
        
        NSMutableArray *moviesArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *movieDict in movieDictionaries) {
            JJTMovie *movie = [[JJTMovie alloc] initWithDictionary:movieDict];
            [moviesArray addObject:movie];
        }
        block(moviesArray);
    }] resume];
}

@end
