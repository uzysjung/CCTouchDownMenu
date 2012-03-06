//
//  HelloWorldLayer.m
//  CCTouchDownSample
//
//  Created by Uzys on 12. 3. 6..
//  Copyright Uzys 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDownMenu.h"
// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        CCTouchDownMenu *menuButtons = [CCTouchDownMenu menuWithItems:nil];
        menuButtons.position = CGPointZero;
        menuButtons.tag =1;
        [self addChild:menuButtons];
        
        CCMenuItem *btnIcon = [CCMenuItemImage itemFromNormalImage:@"Icon-72.png" selectedImage:@"Icon-72.png" target:self selector:@selector(MenuBtnTapped:)]; 
        btnIcon.tag =11;
        btnIcon.position = ccp(10.f,10.f);
        btnIcon.anchorPoint = CGPointZero;
        [menuButtons addChild:btnIcon];
        
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		label.tag = 2;
        
		// add the label as a child to this Layer
		[self addChild: label];
        [label setVisible:NO];
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
- (void) MenuBtnTapped:(id) sender 
{
    CCMenuItemImage *menu = (CCMenuItemImage *) sender;
    if(menu.tag ==11)
    {
        CCLabelTTF *label = (CCLabelTTF*) [self getChildByTag:2];
        
        if(label.visible)
        {
            [label setVisible:NO];   
        }
        else
        {
            [label setVisible:YES]; 
        }
    }
    
}
@end
