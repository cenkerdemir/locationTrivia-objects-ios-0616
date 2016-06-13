//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Cenker Demir on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@interface FISLocation ()

//@property (nonatomic, readwrite) NSString *name;
//@property (nonatomic, readwrite) CGFloat latitude;
//@property (nonatomic, readwrite) CGFloat longitude;
//@property (strong, nonatomic, readwrite) NSMutableArray *trivia;

@end

@implementation FISLocation

-(instancetype)init {
    self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    return self;
}

-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if ([self.name length] > length) {
        NSString *truncatedName = [self.name substringToIndex:length];
        return truncatedName;
    }
    else {
        return self.name;
    }
}

-(BOOL)hasValidData {
    BOOL isNameValid = YES;
    if ([self.name length] < 1) {
        isNameValid = NO;
    }
    if (self.latitude <= -90 || self.latitude >= 90) {
        isNameValid = NO;
    }
    if (self.longitude <= -180 || self.longitude >= 180) {
        isNameValid = NO;
    }
    return isNameValid;
}


-(FISTrivium *)triviumWithMostLikes {
    if (![self.trivia count]) {
        return nil;
    }
    
      //solution with an for-in loop
//    FISTrivium *mostLikedTrivium = [[FISTrivium alloc] init];
//    for (FISTrivium *trivium in self.trivia) {
//        if (trivium.likes > mostLikedTrivium.likes) {
//            mostLikedTrivium = trivium;
//        }
//    }
//    return mostLikedTrivium;
    NSSortDescriptor *sortByLocAsc = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:YES];
    [self.trivia sortUsingDescriptors:@[sortByLocAsc]];
    return [self.trivia lastObject];
}

@end
