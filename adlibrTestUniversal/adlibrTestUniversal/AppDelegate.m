/*
 * adlibr - Library for mobile AD mediation.
 * http://adlibr.com
 * Copyright (c) 2012 Mocoplex, Inc.  All rights reserved.
 * Licensed under the BSD open source license.
 */

#import "AppDelegate.h"
#import "ViewController.h"

#import "AdlibManager.h"

#import "SubAdlibAdViewInmobi.h"


#import "SubAdlibAdViewAdam.h"
#import "SubAdlibAdViewAdmob.h"
#import "SubAdlibAdViewCauly.h"
#import "SubAdlibAdViewTAD.h"
#import "SubAdlibAdViewiAd.h"
#import "SubAdlibAdViewAdcube.h"
#import "SubAdlibAdViewNaverAdPost.h"
#import "SubAdlibAdViewShallWeAd.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)initAdlib
{
    NSString* adlibKey;
    
    // 애드립에서 발급받은 키를 입력해주세요.
    adlibKey = @"ADLIBr - KEY";
        
    /*
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];

    if ([countryCode isEqualToString:@"KR"]) {
        // 다국어 스케줄을 설정하시려면 애드립에서 별도로 키를 생성하시고 해당 키를 적용해주세요.
        adlibKey = @"대한민국 광고 스케줄링";
    } 
    else if ([countryCode isEqualToString:@"US"]) {
        // 다국어 스케줄을 설정하시려면 애드립에서 별도로 키를 생성하시고 해당 키를 적용해주세요.
        adlibKey = @"미국";
    }
    else
        adlibKey = @"기타";
    */
    
    [[AdlibManager sharedSingletonClass] initAdlib:adlibKey];
    
    // 제휴 플랫폼을 연결합니다.
    [[AdlibManager sharedSingletonClass] setPlatform:@"INMOBI" withClass:[SubAdlibAdViewInmobi class]];
    // 애드립 기본 프로젝트에 제휴 플랫폼 연동을 위한 모든 부분이 구현되어 있으며,
    // 제휴 플랫폼을 통해 발급받은 APP-ID 를 구현부에 연결하기만 하면,
    // 애드립에서 제휴 플랫폼에서 발생한 수익의 일부를 reward point로 더 적립해드립니다.
    // 자세한 사항은 http://adlibr.com/rpoint.jsp 를 참조해주세요.
    
    // 쓰지 않을 광고 플랫폼은 삭제해주세요.
    [[AdlibManager sharedSingletonClass] setPlatform:@"ADAM" withClass:[SubAdlibAdViewAdam class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"ADMOB" withClass:[SubAdlibAdViewAdmob class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"CAULY" withClass:[SubAdlibAdViewCauly class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"TAD" withClass:[SubAdlibAdViewTAD class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"IAD" withClass:[SubAdlibAdViewiAd class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"ADCUBE" withClass:[SubAdlibAdViewAdcube class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"NAVER" withClass:[SubAdlibAdViewNaverAdPost class]];
    [[AdlibManager sharedSingletonClass] setPlatform:@"SHALLWEAD" withClass:[SubAdlibAdViewShallWeAd class]];
    // 쓰지 않을 광고 플랫폼은 삭제해주세요.
    
    // 광고 타겟팅을 위한 추가 옵션을 입력합니다. (옵션)
    
    // age - 0/전체 , F/여자 , M/남자
    // gender - 0/전체 , 10/10대 , 20/20대 , 30/30대 , 40/40대 이상    
    [[AdlibManager sharedSingletonClass] setConfigWithAge:@"0" withGender:@"F"];    
    
    // 위도, 경도
    [[AdlibManager sharedSingletonClass] setConfigWithLat:@"37.529451" withLon:@"126.871035"];
}


- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initAdlib];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
