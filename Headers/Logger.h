#import <Foundation/Foundation.h>

#define LOG_PREFIX @"[Revenge]"
#define Log(fmt, ...) NSLog((LOG_PREFIX @" " fmt), ##__VA_ARGS__)
