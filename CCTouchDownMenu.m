//
//  CustomCCMenu.m
//  MyName
//
//  Created by Uzys on 12. 1. 31..
//  Copyright 2012 Uzys. All rights reserved.
//

#import "CCTouchDownMenu.h"


@implementation CCTouchDownMenu


-(CCMenuItem *) itemForTouch: (UITouch *) touch
{
	CGPoint touchLocation = [touch locationInView: [touch view]];
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	
	CCMenuItem* item;
	CCARRAY_FOREACH(children_, item){
		// ignore invisible and disabled items: issue #779, #866
		if ( [item visible] && [item isEnabled] ) {
			
			CGPoint local = [item convertToNodeSpace:touchLocation];
			CGRect r = [item rect];
			r.origin = CGPointZero;
			
			if( CGRectContainsPoint( r, local ) )
				return item;
		}
	}
	return nil;
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
	if( state_ != kCCMenuStateWaiting || !visible_ )
		return NO;
	
	for( CCNode *c = self.parent; c != nil; c = c.parent )
		if( c.visible == NO )
			return NO;
    
	selectedItem_ = [self itemForTouch:touch];
	[selectedItem_ selected];
	
	if( selectedItem_ ) {
		
        [selectedItem_ unselected];
        [selectedItem_ activate];
        state_ = kCCMenuStateWaiting;
		return NO;
	}
	return NO;
}

@end
