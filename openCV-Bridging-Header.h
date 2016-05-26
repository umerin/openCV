//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIkit.h>

@interface openCV : NSObject
+(UIImage *)DetectEdgeWithImage:(UIImage *)UIImage;
@end