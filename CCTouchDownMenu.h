//
//  CustomCCMenu.h
//  MyName
//
//  Created by Uzys on 12. 1. 31..
//  Copyright 2012 Uzys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCTouchDownMenu : CCMenu {
    
}
-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
@end
