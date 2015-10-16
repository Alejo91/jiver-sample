//
//  ViewController.m
//  JiveriOSSample
//
//  Created by Jed Kyung on 2015. 7. 29..
//  Copyright (c) 2015년 JIVER.CO. All rights reserved.
//

#import "ViewController.h"
#import "ChattingTableViewController.h"
#import "MessagingTableViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *) imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void) initViews
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"_jiver_img_bg_default.jpg"]];
    [self.backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.backgroundImageView setClipsToBounds:YES];
    [self.view addSubview:self.backgroundImageView];
    
    // JIVER Logo
    self.jiverLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"_jiver_icon_jiver"]];
    [self.jiverLogoImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.jiverLogoImageView];
    
    // JIVER Label
    self.jiverLabel = [[UILabel alloc] init];
    [self.jiverLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverLabel setText:@"JIVER"];
    [self.jiverLabel setTextColor:[UIColor whiteColor]];
    [self.jiverLabel setFont:[UIFont boldSystemFontOfSize:28.0]];
    [self.jiverLabel setFont:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:28]];
    [self.view addSubview:self.jiverLabel];
    
    // JIVER User Nickname Label
    self.jiverUserNicknameLabel = [[UILabel alloc] init];
    [self.jiverUserNicknameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverUserNicknameLabel setText:@"Enter your nickname."];
    [self.jiverUserNicknameLabel setTextColor:[UIColor whiteColor]];
    [self.jiverUserNicknameLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.view addSubview:self.jiverUserNicknameLabel];
    
    // JIVER User Nickname
    self.jiverUserNicknameTextField = [[UITextField alloc] init];
    [self.jiverUserNicknameTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverUserNicknameTextField setBackground:[self imageFromColor:UIColorFromRGB(0xE8EAF6)]];
    [self.jiverUserNicknameTextField setClipsToBounds:YES];
    [[self.jiverUserNicknameTextField layer] setCornerRadius:4];
    UIView *leftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 0)];
    UIView *rightPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 0)];
    self.jiverUserNicknameTextField.leftView = leftPaddingView;
    self.jiverUserNicknameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.jiverUserNicknameTextField.rightView = rightPaddingView;
    self.jiverUserNicknameTextField.rightViewMode = UITextFieldViewModeAlways;
    [self.jiverUserNicknameTextField setPlaceholder:@"Nickname."];
    [self.jiverUserNicknameTextField setFont:[UIFont systemFontOfSize:16]];
    [self.jiverUserNicknameTextField setReturnKeyType:UIReturnKeyDone];
    [self.jiverUserNicknameTextField setDelegate:self];
    
    // Set Default User Nickname
    NSString *USER_ID = [JiverUtils deviceUniqueID];
    //    USER_ID = @"8a4931bf-95d3-46dd-8ad6-bd6d60c6e5f7";
    //    USER_ID = @"821bb508-bc76-419a-b777-f25080c7dfa0";
    NSString *USER_NAME = [NSString stringWithFormat:@"User-%@", [USER_ID substringToIndex:5]];
    [self.jiverUserNicknameTextField setText:USER_NAME];
    
    [self.view addSubview:self.jiverUserNicknameTextField];
    
    // JIVER Open Lobby Channel for Sample
    self.jiverChatStartButton = [[UIButton alloc] init];
    [self.jiverChatStartButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverChatStartButton setBackgroundImage:[self imageFromColor:UIColorFromRGB(0xAB47BC)] forState:UIControlStateNormal];
    [self.jiverChatStartButton setClipsToBounds:YES];
    [[self.jiverChatStartButton layer] setCornerRadius:4];
    [self.jiverChatStartButton addTarget:self action:@selector(clickJiverChatStartButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.jiverChatStartButton setTitle:@"Join Lobby Channel" forState:UIControlStateNormal];
    [self.jiverChatStartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.jiverChatStartButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.view addSubview:self.jiverChatStartButton];
    
    // JIVER Open Channel List for Sample
    self.jiverChannelListButton = [[UIButton alloc] init];
    [self.jiverChannelListButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverChannelListButton setBackgroundImage:[self imageFromColor:UIColorFromRGB(0xAB47BC)] forState:UIControlStateNormal];
    [self.jiverChannelListButton setClipsToBounds:YES];
    [[self.jiverChannelListButton layer] setCornerRadius:4];
    [self.jiverChannelListButton addTarget:self action:@selector(clickJiverChannelListButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.jiverChannelListButton setTitle:@"Channel List" forState:UIControlStateNormal];
    [self.jiverChannelListButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.jiverChannelListButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.view addSubview:self.jiverChannelListButton];
    
    // JIVER Open Member list of Lobby Channel
    self.jiverLobbyMemberListButton = [[UIButton alloc] init];
    [self.jiverLobbyMemberListButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverLobbyMemberListButton setBackgroundImage:[self imageFromColor:UIColorFromRGB(0xAB47BC)] forState:UIControlStateNormal];
    [self.jiverLobbyMemberListButton setClipsToBounds:YES];
    [[self.jiverLobbyMemberListButton layer] setCornerRadius:4];
    [self.jiverLobbyMemberListButton addTarget:self action:@selector(clickJiverLobbyMemberListButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.jiverLobbyMemberListButton setTitle:@"Start a Messaging" forState:UIControlStateNormal];
    [self.jiverLobbyMemberListButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.jiverLobbyMemberListButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.view addSubview:self.jiverLobbyMemberListButton];
    
    // JIVER Open Messaging Channel List
    self.jiverMessagingChannelListButton = [[UIButton alloc] init];
    [self.jiverMessagingChannelListButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.jiverMessagingChannelListButton setBackgroundImage:[self imageFromColor:UIColorFromRGB(0xAB47BC)] forState:UIControlStateNormal];
    [self.jiverMessagingChannelListButton setClipsToBounds:YES];
    [[self.jiverMessagingChannelListButton layer] setCornerRadius:4];
    [self.jiverMessagingChannelListButton addTarget:self action:@selector(clickJiverMessagingChannelListButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.jiverMessagingChannelListButton setTitle:@"Messaging Channel List" forState:UIControlStateNormal];
    [self.jiverMessagingChannelListButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.jiverMessagingChannelListButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.view addSubview:self.jiverMessagingChannelListButton];
    
    // Background Image
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1 constant:0]];
    
    // JIVER Logo
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLogoImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLogoImageView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1 constant:48]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLogoImageView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:80]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLogoImageView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:80]];
    
    // JIVER Label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverLogoImageView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:8]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    
    // JIVER User Nickname Label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameLabel
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:220]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:36]];
    
    
    // JIVER User Nickname TextField
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameTextField
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameTextField
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverUserNicknameLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:4]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameTextField
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:220]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverUserNicknameTextField
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:36]];
    
    // JIVER Open Lobby Button.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChatStartButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChatStartButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverUserNicknameTextField
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:40]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChatStartButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:220]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChatStartButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:36]];
    
    // JIVER Open Lobby Button.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChannelListButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChannelListButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverChatStartButton
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:12]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChannelListButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:220]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverChannelListButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:36]];
    // JIVER Member List at Lobby.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLobbyMemberListButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLobbyMemberListButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverChannelListButton
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:12]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLobbyMemberListButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:220]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverLobbyMemberListButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:36]];
    
    // JIVER Messaging Channel List.
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverMessagingChannelListButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverMessagingChannelListButton
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.jiverLobbyMemberListButton
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1 constant:12]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverMessagingChannelListButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:220]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.jiverMessagingChannelListButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1 constant:36]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)clickJiverChatStartButton:(id)sender
{
    if ([[self.jiverUserNicknameTextField text] length] > 0) {
        [self startJiverWithUserName:[self.jiverUserNicknameTextField text] andChatMode:kChatModeChatting andViewMode:(int)kChattingViewMode];
    }
}

- (void)clickJiverChannelListButton:(id)sender
{
    if ([[self.jiverUserNicknameTextField text] length] > 0) {
        [self startJiverWithUserName:[self.jiverUserNicknameTextField text] andChatMode:kChatModeChatting andViewMode:(int)kChannelListViewMode];
    }
}

- (void)clickJiverLobbyMemberListButton:(id)sender
{
    if ([[self.jiverUserNicknameTextField text] length] > 0) {
        [self startJiverWithUserName:[self.jiverUserNicknameTextField text] andChatMode:kChatModeMessaging andViewMode:(int)kMessagingMemberViewMode];
    }
}

- (void)clickJiverMessagingChannelListButton:(id)sender
{
    if ([[self.jiverUserNicknameTextField text] length] > 0) {
        [self startJiverWithUserName:[self.jiverUserNicknameTextField text] andChatMode:kChatModeMessaging andViewMode:(int)kMessagingChannelListViewMode];
    }
}

- (void) startJiverWithUserName:(NSString *)userName andChatMode:(int)chatMode andViewMode:(int)viewMode
{
//    NSString *APP_ID = @"A7A2672C-AD11-11E4-8DAA-0A18B21C2D82";
    NSString *APP_ID = @"EAD881A1-3712-4A01-9483-0A1E1A6B3DEC";
//    NSString *USER_ID = [JiverUtils deviceUniqueID];
    NSString *USER_ID = @"1234567891";
    NSString *USER_NAME = userName;
//    NSString *CHANNEL_URL = @"jia_test.Lobby";
    NSString *CHANNEL_URL = @"potato.ThugLifeHomis";
    
    if (chatMode == kChatModeChatting) {
        ChattingTableViewController *viewController = [[ChattingTableViewController alloc] init];
        
        [Jiver initAppId:APP_ID selectDeviceId:kJiverInitWithIDFV];
        
        [viewController setViewMode:viewMode];
        [viewController initChannelTitle];
        [viewController setChannelUrl:CHANNEL_URL];
        [viewController setUserName:USER_NAME];
        [viewController setUserId:USER_ID];
        
#if 0
        [self.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [navController setModalPresentationStyle:UIModalPresentationCurrentContext];
        [self.navigationController presentViewController:navController animated:YES completion:nil];
#else
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self presentViewController:navigationController animated:YES completion: nil];
#endif
    }
    else if (chatMode == kChatModeMessaging) {
        MessagingTableViewController *viewController = [[MessagingTableViewController alloc] init];
        
        [Jiver initAppId:APP_ID selectDeviceId:kJiverInitWithIDFV];
        
        [viewController setViewMode:viewMode];
        [viewController initChannelTitle];
        [viewController setChannelUrl:CHANNEL_URL];
        [viewController setUserName:USER_NAME];
        [viewController setUserId:USER_ID];
        
#if 0
        [self.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [navController setModalPresentationStyle:UIModalPresentationCurrentContext];
        [self.navigationController presentViewController:navController animated:YES completion:nil];
#else
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self presentViewController:navigationController animated:YES completion: nil];
#endif
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
