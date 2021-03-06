/*
 * adlibr - Library for mobile AD mediation.
 * http://adlibr.com
 * Copyright (c) 2012 Mocoplex, Inc.  All rights reserved.
 * Licensed under the BSD open source license.
 */

/*
 * confirmed compatible with NaverAdPost SDK 1.0
 */

#import "SubAdlibAdViewNaverAdPost.h"

// NAVER의 APP 아이디를 설정합니다.
#define NAVER_ID @"test1234"

@implementation SubAdlibAdViewNaverAdPost

+ (BOOL)isStaticObject
{
    return YES;
}

- (void)query:(UIViewController*)parent
{
    [super query:parent];
    
    self.view.autoresizesSubviews = NO;
    
    static BOOL bIninintedObject = NO;
    if(!bIninintedObject)
    {
        // 광고뷰를 생성합니다.
        ad = [MobileAdView sharedMobileAdView];
        
        CGRect rt = CGRectMake(0, 0, self.view.bounds.size.width, 50);
        ad.frame = rt;
        
        [ad setSuperViewController:parent];
        [ad setChannelId:NAVER_ID];
        //    [ad setIsTest:YES];
        [ad setDelegate:self];
        
        [self.view addSubview:ad];
    }
    
    [ad start];
    
    if(bGotAd)
        [self gotAd];
}

- (void)clearAdView
{
    if(ad != nil)
    {
        [ad stop];
        [ad setSuperViewController:nil];
    }
    
    [super clearAdView];
}

- (CGSize)size
{
    int w;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    if([self isPortrait])
    {
        w = screenWidth;
    }
    else
    {
        w = screenHeight;
    }
    
    return CGSizeMake(w, 50);
}

- (void)orientationChanged
{
    [super orientationChanged];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    int w;
    if([self isPortrait])
    {
        w = screenWidth;
    }
    else
    {
        w = screenHeight;
    }
    
    ad.frame = CGRectMake(0, 0, w, 50);
}

#pragma MobileAdViewDelegate

- (void)adDidReceived:(MobileAdErrorType)err
{
    // 광고를 받아온 경우나, 승인을 기다리는 경우만 화면에 보이게합니다.
    if(err == ERROR_SUCCESS || err == ERROR_WAIT_FOR_APPROVAL || err == ERROR_INTERNAL)
    {
        bGotAd = YES;
        [self gotAd];
    }
    else {
        [self failed];
    }
}

@end