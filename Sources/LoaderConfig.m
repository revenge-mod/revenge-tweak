#import "LoaderConfig.h"
#import "Utils.h"
#import "Logger.h"

@implementation LoaderConfig

+ (instancetype)defaultConfig {
    LoaderConfig *config = [[LoaderConfig alloc] init];
    config.customLoadUrlEnabled = NO;
    config.customLoadUrl = [NSURL URLWithString:@"http://localhost:4040/revenge.js"];
    return config;
}

+ (instancetype)getLoaderConfig {
    BunnyLog(@"Getting loader config");

    NSURL *loaderConfigUrl = [getPyoncordDirectory() URLByAppendingPathComponent:@"loader.json"];

    if ([[NSFileManager defaultManager] fileExistsAtPath:loaderConfigUrl.path]) {
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:loaderConfigUrl];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

        if (json && !error) {
            LoaderConfig *config = [[LoaderConfig alloc] init];
            NSDictionary *customLoadUrl = json[@"customLoadUrl"];
            if (customLoadUrl) {
                config.customLoadUrlEnabled = [customLoadUrl[@"enabled"] boolValue];
                NSString *urlString = customLoadUrl[@"url"];
                if (urlString) {
                    config.customLoadUrl = [NSURL URLWithString:urlString];
                }
            }
            return config;
        }
    }

    BunnyLog(@"Couldn't get loader config");
    return [LoaderConfig defaultConfig];
}

- (BOOL)saveConfig {
    NSURL *loaderConfigUrl = [getPyoncordDirectory() URLByAppendingPathComponent:@"loader.json"];
    NSDictionary *json = @{
        @"customLoadUrl": @{
            @"enabled": @(self.customLoadUrlEnabled),
            @"url": self.customLoadUrl.absoluteString
        }
    };

    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:0 error:nil];
    return [data writeToURL:loaderConfigUrl atomically:YES];
}

@end
