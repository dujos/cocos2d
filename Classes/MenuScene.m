#import "MenuScene.h"

@implementation MenuScene

+(MenuScene* )scene
{
	return [[self alloc] init];
}

-(id)init;
{
    self = [super init];
    if (!self)
        return(nil);

    newGame = [self loadButton:newGame
                         title:@"new game"
                         image:@"b1.png"
                      position:CGPointMake(425.f, 345.f)
                         scale:2.f];
    
    [newGame setTarget:self
              selector:@selector(clickNewGame:)];
    [self addChild:newGame];

    kong = [self loadButton:kong
                      title:@"snake"
                      image:@"snake.png"
                   position:CGPointMake(425.f, 445.f)
                      scale:1.f];
    
    [kong setTarget:self
           selector:@selector(selectDonkey:)];
    [self addChild:kong];

    diddy = [self loadButton:diddy
                       title:@"spider"
                       image:@"spider.png"
                    position:CGPointMake(625.f, 445.f)
                       scale:1.f];
    
    [diddy setTarget:self
            selector:@selector(selectDiddy:)];
    [self addChild:diddy];
    
    return self;
}

-(CCButton*)loadButton:(CCButton*)button
                 title:(NSString* )buttonTitle
                 image:(NSString* )imageTitle
              position:(CGPoint)buttonPos
                 scale:(float)buttonScale

{
    button = [CCButton buttonWithTitle:buttonTitle
                           spriteFrame:[CCSpriteFrame
                   frameWithImageNamed:imageTitle]];
    
    [button setPosition:buttonPos];
    [button setScaleY:buttonScale];
    
    return button;
}

-(void)selectDonkey:(id)sender
{
    GameScene* gameScene = [GameScene scene];
    [[CCDirector sharedDirector] replaceScene:gameScene
                               withTransition:[CCTransition
                  transitionPushWithDirection:CCTransitionDirectionDown
                                     duration:2.0f]];
    [gameScene startGameLevel:1 kong:@"donkey" index:0];
}

-(void)selectDiddy:(id)sender
{
    GameScene* gameScene = [GameScene scene];
    [[CCDirector sharedDirector] replaceScene:gameScene
                               withTransition:[CCTransition
                  transitionPushWithDirection:CCTransitionDirectionUp
                                     duration:2.0f]];
    [gameScene startGameLevel:1 kong:@"diddy" index:1];
}

-(void)clickNewGame:(id)sender
{
    GameScene* gameScene = [GameScene scene];
    [[CCDirector sharedDirector] replaceScene:gameScene
                               withTransition:[CCTransition
                  transitionPushWithDirection:CCTransitionDirectionLeft
                                     duration:1.0f]];
    [gameScene startGameLevel:1 kong:@"diddy"];
}

-(void)clickResumeGame:(id)sender
{
    GameScene* gameScene = [GameScene scene];
    [[CCDirector sharedDirector] replaceScene:gameScene
                               withTransition:[CCTransition
                  transitionPushWithDirection:CCTransitionDirectionLeft
                                     duration:1.0f]];
    [gameScene startGameLevel:1 kong:@"diddy"];
}

-(void)clickPauseGame:(id)sender
{
    MapScene* mapScene = [MapScene scene];
    [[CCDirector sharedDirector] replaceScene:mapScene
                               withTransition:[CCTransition
                  transitionPushWithDirection:CCTransitionDirectionLeft
                                     duration:1.0f]];
    [mapScene startMap];
}

@end