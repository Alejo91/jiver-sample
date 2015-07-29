//
//  MemberTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface MemberTableViewCell : UITableViewCell

@property (retain) UIImageView *profileImageView;
@property (retain) UILabel *nicknameLabel;
@property (retain) UIView *seperateLineView;
@property (retain) UIImageView *checkImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void) setModel:(JiverMember *)model withCheckMark:(BOOL)check;

@end
