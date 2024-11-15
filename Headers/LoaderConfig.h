#import <Foundation/Foundation.h>

@interface LoaderConfig : NSObject
@property (nonatomic, assign) BOOL customLoadUrlEnabled;
@property (nonatomic, strong) NSURL *customLoadUrl;
+ (instancetype)defaultConfig;
+ (instancetype)getLoaderConfig;
@end 