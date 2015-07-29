//
//  MessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MessageTableViewCell : UITableViewCell

@property (retain) JiverMessage *message;
@property (retain) UILabel *messageLabel;

- (void) setModel:(JiverMessage *)message;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
