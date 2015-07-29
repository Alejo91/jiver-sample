//
//  ViewController.h
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property UIImageView *jiverLogoImageView;
@property UILabel *jiverLabel;

@property UIImageView *backgroundImageView;
@property UIButton *jiverChatStartButton;
@property UIButton *jiverChannelListButton;
@property UIButton *jiverLobbyMemberListButton;
@property UIButton *jiverMessagingChannelListButton;
@property UILabel *jiverUserNicknameLabel;
@property UITextField *jiverUserNicknameTextField;

- (UIImage *) imageFromColor:(UIColor *)color;

@end

