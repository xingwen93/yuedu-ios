//
//  NSString+Extension.m
//  YueduFM
//
//  Created by StarNet on 9/20/15.
//  Copyright (c) 2015 StarNet. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

- (NSURL* )url {
    return [NSURL URLWithString:self];
}

- (NSURL* )fileURL {
    return [NSURL fileURLWithPath:self];
}

+ (NSString* )stringWithSeconds:(int)seconds {
    if (seconds < 0) seconds = 0;
    
    int s = (int)seconds%60;
    int min = seconds/60;
    int m = min%60;
    int h = min/60;
    
    NSString* str = nil;
    if (h) {
        str = [NSString stringWithFormat:@"%d:%02d:%02d", h, m, s];
    } else {
        str = [NSString stringWithFormat:@"%d:%02d", m, s];
    }
    return str;
}

- (NSString *)sha1
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}


@end
