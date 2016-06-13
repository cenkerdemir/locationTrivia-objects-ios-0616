//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)allLocationNames {
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    for (FISLocation *eachLocation in self.locations) {
        [allNames addObject:eachLocation.name];
    }
    return allNames;
}

-(FISLocation *)locationNamed:(NSString *)name {
    
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@",name];
    NSArray *arrayForTheMatchedLocation = [self.locations filteredArrayUsingPredicate:namePredicate];
    
    if ([arrayForTheMatchedLocation count]) {
        FISLocation *locationWithName = arrayForTheMatchedLocation[0];
        return locationWithName;
    }
    else {
        return nil;
    }
    
    // for in loop method
//    for (FISLocation *locationWithName in self.locations) {
//        if ([locationWithName.name isEqualToString:name]) {
//            return locationWithName;
//        }
//    }
//    return nil;
}

-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    NSMutableArray *locationsWithinMargin = [[NSMutableArray alloc] init];
    for (FISLocation *eachLocation in self.locations) {
        if (fabs(eachLocation.latitude - latitude) <= margin || fabs(eachLocation.latitude + latitude) <= margin) {
            if (fabs(eachLocation.longitude - longitude) <= margin || fabs(eachLocation.longitude + longitude) <= margin) {
                [locationsWithinMargin addObject:eachLocation];
            }
        }
    }
    return locationsWithinMargin;
}


@end
