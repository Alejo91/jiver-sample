//
//  StructuredMessageTableViewCell.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 10. 14..
//  Copyright © 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface StructuredMessageTableViewCell : UITableViewCell

@property (retain) JiverStructuredMessage *structuredMessage;
@property (retain) UIView *cellView;
@property (retain) UILabel *titleLabel;
@property (retain) UIImageView *thumbImageView;
@property (retain) UILabel *descLabel;
@property (retain) UIView *dividerView;
@property (retain) UIImageView *structuredIconImageView;
@property (retain) UILabel *structuredNameLabel;

- (void) setModel:(JiverStructuredMessage *)model;
- (CGFloat)getHeightOfViewCell:(CGFloat)totalWidth;

@end
