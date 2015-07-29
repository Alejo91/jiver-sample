//
//  TypingNowView.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JiverSDK/JiverSDK.h>
#import "JiverCommon.h"

@interface TypingNowView : UIView

@property (retain) UIImageView *typingImageView;
@property (retain) UILabel *typingLabel;

- (id) initWithFrame:(CGRect)frame;
- (void) setModel:(NSDictionary *)typeStatus;

@end
