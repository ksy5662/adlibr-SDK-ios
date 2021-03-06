/*
 * adlibr - Library for mobile AD mediation.
 * http://adlibr.com
 * Copyright (c) 2012 Mocoplex, Inc.  All rights reserved.
 * Licensed under the BSD open source license.
 */

/*
 * confirmed compatible with t-ad SDK 2.4.6.6
 */

#import <UIKit/UIKit.h>
#import "SubAdlibAdViewCore.h"
#import "TadViewController.h"

@interface SubAdlibAdViewTAD : SubAdlibAdViewCore<TadDelegate>
{
    BOOL    bGotAd;
    BOOL    iPad;    
}

@end
