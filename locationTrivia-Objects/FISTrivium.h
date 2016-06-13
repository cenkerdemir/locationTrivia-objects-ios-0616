//
//  FISTrivium.h
//  locationTrivia-Objects
//
//  Created by Cenker Demir on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISTrivium : NSObject

@property (nonatomic, readonly)  NSString *content;
@property (nonatomic, readonly) NSUInteger likes;

-(instancetype)init;
-(instancetype)initWithContent:(NSString *)content likes:(NSUInteger)likes;

@end
