//
//  MessagingStructuredMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 10. 15..
//  Copyright © 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingStructuredMessageTableViewCell : UITableViewCell

@property (retain) JiverStructuredMessage *message;
@property UIImageView *profileImageView;
//@property UIImageView *fileImageView;
@property UIImageView *messageBackgroundImageView;
@property (retain) UILabel *nicknameLabel;
@property (retain) UILabel *dateTimeLabel;

@property (retain) UIImageView *thumbImageView;
@property (retain) UILabel *titleLabel;
@property (retain) UILabel *descLabel;
@property (retain) UIView *dividerView;
@property (retain) UIImageView *structuredIconImageView;
@property (retain) UILabel *structuredNameLabel;
@property (retain) UIImageView *structuredBotImageView;

- (void) setModel:(JiverStructuredMessage *)model;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
