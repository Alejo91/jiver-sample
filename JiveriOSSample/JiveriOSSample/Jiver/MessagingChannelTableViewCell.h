//
//  MessagingChannelTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingChannelTableViewCell : UITableViewCell

@property (retain) UIImageView *profileImageView;
@property (retain) UILabel *nicknameLabel;
@property (retain) UILabel *lastMessageLabel;
@property (retain) UIView *bottomLineView;
@property (retain) UIImageView *unreadCountImageView;
@property (retain) UILabel *unreadCountLabel;
@property (retain) UILabel *lastMessageDateLabel;
@property (retain) UIImageView *checkImageView;
@property (retain) UIImageView *memberCountImageView;
@property (retain) UILabel *memberCountLabel;

- (void) setModel:(JiverMessagingChannel *)model withCheckMark:(BOOL)check;

@end
