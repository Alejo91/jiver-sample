//
//  ChannelTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface ChannelTableViewCell : UITableViewCell

@property (retain) UILabel *channelUrlLabel;
@property (retain) UILabel *memberCountLabel;
@property (retain) UIImageView *coverImageView;
@property (retain) UIImageView *checkImageView;
@property (retain) UIView *bottomLineView;

- (void) setModel:(JiverChannel *)model;

@end
