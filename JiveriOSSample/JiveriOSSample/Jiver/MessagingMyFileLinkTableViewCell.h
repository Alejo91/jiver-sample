//
//  MessagingMyFileLinkTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingMyFileLinkTableViewCell : UITableViewCell

@property (retain) JiverFileLink *fileLink;
@property (retain) JiverMessagingChannel *currentChannel;
@property UIImageView *messageBackgroundImageView;
@property (retain) UILabel *dateTimeLabel;
@property (retain) UILabel *unreadLabel;
@property UIImageView *fileImageView;
@property (retain) NSMutableDictionary *readStatus;

- (void) setContinuousMessage:(BOOL)continuousFlag;
- (void) setModel:(JiverFileLink *)model;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
