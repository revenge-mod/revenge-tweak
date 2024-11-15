#import <Foundation/Foundation.h>

#define LOG_PREFIX @"[Revenge]"
#define RevengeLog(fmt, ...) NSLog((LOG_PREFIX @" " fmt), ##__VA_ARGS__)
