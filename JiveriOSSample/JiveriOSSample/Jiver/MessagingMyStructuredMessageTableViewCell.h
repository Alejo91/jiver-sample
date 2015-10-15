//
//  MessagingMyStructuredMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 10. 15..
//  Copyright © 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>

@interface MessagingMyStructuredMessageTableViewCell : UITableViewCell

@property (retain) JiverStructuredMessage *message;
@property (retain) UIImageView *messageBackgroundImageView;
@property (retain) UIImageView *thumbImageView;
@property (retain) UILabel *titleLabel;
@property (retain) UILabel *descLabel;
@property (retain) UIView *dividerView;
@property (retain) UILabel *dateTimeLabel;
@property (retain) UILabel *unreadLabel;
@property (retain) NSMutableDictionary *readStatus;
@property (retain) UIImageView *structuredIconImageView;
@property (retain) UILabel *structuredNameLabel;
@property (retain) UIImageView *structuredBotImageView;

- (void) setContinuousMessage:(BOOL)continuousFlag;
- (void) setModel:(JiverStructuredMessage *)message;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
