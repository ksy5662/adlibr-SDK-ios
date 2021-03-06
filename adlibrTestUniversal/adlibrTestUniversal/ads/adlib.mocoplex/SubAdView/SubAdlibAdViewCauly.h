/*
 * adlibr - Library for mobile AD mediation.
 * http://adlibr.com
 * Copyright (c) 2012 Mocoplex, Inc.  All rights reserved.
 * Licensed under the BSD open source license.
 */

/*
 * confirmed compatible with cauly SDK 3.0
 */

#import "SubAdlibAdViewCore.h"
#import "CaulyAdView.h"

@interface SubAdlibAdViewCauly : SubAdlibAdViewCore
{
    CaulyAdView *ad;
    BOOL iPad;
}

@end
