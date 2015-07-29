//
//  SystemMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface SystemMessageTableViewCell : UITableViewCell

@property (retain) UIView *leftLineView;
@property (retain) UIView *rightLineView;
@property (retain) UILabel *messageLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void) setModel:(JiverSystemMessage *)model;

@end
