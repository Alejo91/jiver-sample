//
//  MessagingMyMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingMyMessageTableViewCell : UITableViewCell

@property (retain) JiverMessage *message;
@property (retain) UIImageView *messageBackgroundImageView;
@property (retain) UILabel *messageLabel;
@property (retain) UILabel *dateTimeLabel;
@property (retain) UILabel *unreadLabel;
@property (retain) NSMutableDictionary *readStatus;

- (void) setContinuousMessage:(BOOL)continuousFlag;
- (void) setModel:(JiverMessage *)message;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
