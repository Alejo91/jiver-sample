//
//  MessagingBroadcastMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingBroadcastMessageTableViewCell : UITableViewCell

@property (retain) JiverBroadcastMessage *message;
@property (retain) UILabel *messageLabel;
@property (retain) UIView *innerView;

- (void) setModel:(JiverBroadcastMessage *)message;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
