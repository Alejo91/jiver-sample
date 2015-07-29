//
//  MessagingFileLinkTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingFileLinkTableViewCell : UITableViewCell

@property (retain) JiverFileLink *fileLink;
@property UIImageView *profileImageView;
@property UIImageView *fileImageView;
@property UIImageView *messageBackgroundImageView;
@property (retain) UILabel *nicknameLabel;
@property (retain) UILabel *dateTimeLabel;

- (void) setModel:(JiverFileLink *)model;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end

