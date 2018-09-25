//
//  MisterFusion.h
//  MisterFusion
//
//  Created by 鈴木大貴 on 2017/08/15.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

#import "TargetConditionals.h"

#if TARGET_OS_OSX
#import <AppKit/AppKit.h>
#else
#import <UIKit/UIKit.h>
#endif

//! Project version number for MisterFusion.
FOUNDATION_EXPORT double MisterFusionVersionNumber;

//! Project version string for MisterFusion.
FOUNDATION_EXPORT const unsigned char MisterFusionVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MisterFusion/PublicHeader.h>


