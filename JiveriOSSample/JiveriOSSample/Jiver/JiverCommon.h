//
//  JiverCommon.h
//  JiverSample
//
//  Created by Jed Kyung on 2015. 5. 20..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <QuartzCore/QuartzCore.h>
#import <JiverSDK/JiverSDK.h>

#define kChattingViewMode 0
#define kChannelListViewMode 1

#define kMessagingMemberViewMode 0
#define kMessagingChannelListViewMode 1
#define kMessagingViewMode 2
#define kMessagingChannelListEditViewMode 3
#define kMessagingMemberForGroupChatViewMode 4

#define kChatModeChatting 0
#define kChatModeMessaging 1

#define JIVER_IN_APP_VER @"JIVER Sample v1.1.19"

#pragma mark - ImageCache

@interface ImageCache : NSObject

+ (ImageCache *) sharedInstance;
+ (void) initImageCache;
- (UIImage *)getImage:(NSString *)key;
- (void)setImage:(UIImage *)image withKey:(id<NSCopying>)key;

@end

#pragma mark - JiverUtils

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface JiverUtils : NSObject

+ (NSString *) deviceUniqueID;
+ (void)imageDownload:(NSURL *)url endBlock:(void (^)(NSData *response, NSError *error))onEnd;
+ (NSString *) getUrlFromString:(NSString *)bulk;
+ (NSString *) messageDateTime:(NSTimeInterval) interval;
+ (NSString *) oldMessageDateTime:(NSTimeInterval) interval;
+ (NSString *) lastMessageDateTime:(NSTimeInterval) interval;
+ (NSString *) getChannelNameFromUrl:(NSString *)channelUrl;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGFloat)width;
+ (NSString *) getDisplayMemberNames:(NSArray *)members;
+ (NSString *) getMessagingChannelNames:(NSArray *)members;
+ (NSString *) getDisplayCoverImageUrl:(NSArray *)members;
+ (void) setMessagingMaxMessageTs:(long long)messageTs;
+ (long long) getMessagingMaxMessageTs;

@end

#pragma mark - NSMutableArrat+JiverMessageOrdering
@interface NSMutableArray (JiverMessageOrdering)

- (void) addJiverMessage:(JiverMessageModel *)message updateMessageTsBlock:(void (^)(JiverMessageModel *model))updateMessageTs;

@end