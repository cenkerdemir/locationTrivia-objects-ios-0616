//  FISAppDelegate.h

#import <UIKit/UIKit.h>
//#import "FISLocation.h"

@class FISLocation;

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//public property
@property (strong, nonatomic) NSMutableArray *locations;

//method declarations
-(NSArray *)allLocationNames;
-(FISLocation *)locationNamed:(NSString *)name;
-(NSArray *)locationsNearLatitude:(CGFloat)latitude
                        longitude:(CGFloat)longitude
                           margin:(CGFloat)margin;


@end
