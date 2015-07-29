//
//  MessagingFileMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessagingFileMessageTableViewCell : UITableViewCell

@property (retain) UILabel *nicknameLabel;
@property (retain) UILabel *messageLabel;
@property (retain) UIImageView *fileImageView;
@property (retain) UILabel *filenameLabel;
@property (retain) UILabel *filesizeLabel;

- (void) setModel:(JiverFileLink *)model;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end

