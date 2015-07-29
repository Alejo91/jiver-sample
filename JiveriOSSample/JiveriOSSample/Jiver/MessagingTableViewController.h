//
//  MessagingTableViewController.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"
#import "MessageInputView.h"
#import "MessagingMessageTableViewCell.h"
#import "MessagingMyMessageTableViewCell.h"
#import "MessagingFileLinkTableViewCell.h"
#import "MessagingSystemMessageTableViewCell.h"
#import "MessagingFileMessageTableViewCell.h"
#import "MessagingBroadcastMessageTableViewCell.h"
#import "MessagingMyFileLinkTableViewCell.h"
#import "MemberTableViewCell.h"
#import "MessagingIndicatorView.h"
#import "TypingNowView.h"
#import "MessagingChannelTableViewCell.h"

@interface MessagingTableViewController : UIViewController

@property (retain) UIView *container;
@property (retain) UITableView *tableView;
@property (retain) MessageInputView *messageInputView;
@property (retain) NSString *channelUrl;
@property BOOL openImagePicker;
@property (retain) MessagingIndicatorView *indicatorView;
//@property (retain) UILabel *titleLabel;
@property (retain) NSString *userId;
@property (retain) NSString *userName;
@property (retain) UITableView *channelMemberListTableView;
@property (retain) UITableView *messagingChannelListTableView;
@property (retain) JiverMessagingChannel *currentMessagingChannel;
@property (retain) TypingNowView *typingNowView;
@property (retain) NSString *targetUserId;

- (id) init;
- (void) setViewMode:(int)mode;
- (void) startChatting;
- (void)setIndicatorHidden:(BOOL)hidden;
- (void) initChannelTitle;
- (void) updateChannelTitle;

@end
