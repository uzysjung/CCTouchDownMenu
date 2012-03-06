//
//  AppDelegate.h
//  CCTouchDownSample
//
//  Created by Uzys on 12. 3. 6..
//  Copyright Uzys 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
