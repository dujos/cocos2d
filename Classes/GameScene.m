#import "GameScene.h"
//#import "Background.h"
#import "LevelController.h"
#import "Entity.h"
#import "FireBarrel.h"
#import "ShootBarrel.h"
#import "Sphere.h"
#import "Line.h"

//@class Background;

static GameScene* _gameScene = nil;

@implementation GameScene

+(GameScene *)scene
{
    if (!_gameScene) {
        _gameScene = [[self alloc] init];
        return _gameScene;
    }
    return _gameScene;
}

-(id)init
{
    self = [super init];
    self.userInteractionEnabled = YES;
    
    physicsWorld = [CCPhysicsNode node];
    physicsWorld.gravity = ccp(0.f, 0.f);
    [self addChild:physicsWorld];
    
    return self;
}

-(void)onEnter
{
    [super onEnter];
}

-(void)onExit
{
    [super onExit];
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    Movement* movement = self.kong.getMovement;
    [movement touchBegan:touch withEvent:event];
    
    for (id barrel in [allBarrels objectForKey:@"shoot"]) {
        [barrel touchBegan:touch withEvent:event];
    }
    
    for (id barrel in [allBarrels objectForKey:@"fire"]) {
        [barrel touchBegan:touch withEvent:event];
    }
}

-(Kong* )getKong
{
    return self.kong;
}

-(PickableCache* )getPickableCache
{
    return self._pickableCache;
}

-(EnemyCache* )getEnemyCache
{
    return self._enemyCache;
}

-(HudLayer* )getHudLayer
{
    return self._hudLayer;
}

/*
-(Background* )getBackground
{
    return self._background;
}
*/

-(Coin* )getCoin
{
    return self._coin;
}

-(BalloonBarrel*)getBalloonBarrel
{
    return self._balloonBarrel;
}

-(NSInteger)getKongType
{
    return kongType;
}

-(NSInteger)getLevel
{
    return gameLevel;
}

-(void)loadBananas
{
    [self._pickableCache loadPickablesCircle:CGPointMake(400.f, 400.f)
                                      radius:100.f
                                       index:2
                                    velocity:CGPointMake(0.f, 0.f)
                                       world:physicsWorld];
}

-(void)loadCoins
{
    [self._pickableCache loadPickablesHLine:CGPointMake(400.f, 400.f)
                                      index:1
                                   velocity:CGPointMake(0.f, 0.f)
                                      world:physicsWorld];
}

-(void)loadBarrels {}

-(void)loadBalloons
{
    [self._pickableCache loadPickablesVLine:CGPointMake(400.f, 400.f)
                                      index:0
                                   velocity:CGPointMake(0.f, 0.f)
                                      world:physicsWorld];
}

-(void)startGameLevel:(NSInteger)level
                 kong:(NSString* )selectKong
{
    [self startGameLevel:level kong:selectKong index:0];
}

-(void)startGameLevel:(NSInteger)level
                 kong:(NSString* )selectKong
                index:(int)selection;
{
    gameLevel = level;
    [self startNextLevel];
    
    self._hudLayer = [[HudLayer alloc] initHud:selection];
    [self addChild:self._hudLayer];

    self._kongTile = [[KongTile alloc]
                      initKongTile:physicsWorld];
    [self._kongTile setPos:ccp(100.f, 450.f)];
    [self addChild:self._kongTile];
    
    self._bananaBarrel = [[BananaBarrel alloc]
                          initBananaBarrel:physicsWorld];
    [self._bananaBarrel setPos:ccp(100.f, 400.f)];
    [self addChild:self._bananaBarrel];
    
    self._balloonBarrel = [[BalloonBarrel alloc]
                           initBalloonBarrel:physicsWorld];
    [self._balloonBarrel setPos:ccp(100.f, 350.f)];
    [self addChild:self._balloonBarrel];
    
    self.kong = [[Kong alloc] init:physicsWorld];
    [self.kong setPos:ccp(200.f, 200.f)];
    //[self addChild:self.kong];
    //[physicsWorld addChild:self.kong];
    
    Banana* banana = [[Banana alloc] initBanana:physicsWorld
                                       velocity:ccp(1.f, 0.f)];
    [banana setPos:ccp(300.f, 400.f)];
    [banana setScale:0.5f];
    [self addChild:banana];
    
    //self._background = [[Background alloc] initBackground];
    //[self addChild:self._background];
    //[physicsWorld addChild:self._background];
}

-(void)startNextLevel
{
    [self createPickableCache];
    [self createBarrelCache];
    [self createEnemyCache];
}

-(void)createBarrelCache
{
    fireBarrels = [[NSMutableArray alloc] init];
    shootBarrels = [[NSMutableArray alloc] init];
    
    [fireBarrels addObject:[[FireBarrel alloc]
                            initFireBarrel:0
                            startPosition:CGPointMake(500.f, 300.f)
                            endPosition:CGPointMake(650.f, 300.f)
                            rotation:stopRotation
                            physicsWorld:physicsWorld]];
    
    [fireBarrels addObject:[[FireBarrel alloc]
                            initFireBarrel:1
                            startPosition:CGPointMake(200.f, 300.f)
                            endPosition:CGPointMake(200.f, 300.f)
                            rotation:stopRotation
                            physicsWorld:physicsWorld]];
    
    [fireBarrels addObject:[[FireBarrel alloc]
                            initFireBarrel:0
                            startPosition:CGPointMake(350.f, 500.f)
                            endPosition:CGPointMake(350.f, 350.f)
                            rotation:90
                            physicsWorld:physicsWorld]];
    
    [shootBarrels addObject:[[ShootBarrel alloc]
                             initShootBarrel:0
                                         pos:ccp(200.f, 100.f)
                                physicsWorld:physicsWorld]];

    [shootBarrels addObject:[[ShootBarrel alloc]
                             initShootBarrel:0
                                         pos:ccp(400.f, 100.f)
                                physicsWorld:physicsWorld]];
    
    for (int i = 0; i < shootBarrels.count; i++) {
        [self addChild:shootBarrels[i]];
    }
    
    for (int i = 0; i < fireBarrels.count; i++) {
        [self addChild:fireBarrels[i]];
    }
    
    allBarrels = @{ @"shoot" : fireBarrels, @"fire" : shootBarrels };
}

-(void)createPickableCache
{
    self._pickableCache = [[PickableCache alloc] init];
    [self addChild:self._pickableCache];
    
    [self loadBananas];
    [self loadCoins];
    //[self loadBalloons];
}

-(void)createEnemyCache
{
    self._enemyCache = [EnemyCache node];
    [self addChild:self._enemyCache];
    
    enemies = [[NSMutableArray alloc] init];
    
    [enemies addObject:[[[Krog alloc] initKrog:physicsWorld]
            createKrog:0]];
    [enemies addObject:[[[Krog alloc] initKrog:physicsWorld]
            createKrog:0]];
    [enemies addObject:[[[Krog alloc] initKrog:physicsWorld]
            createKrog:1]];
    [enemies addObject:[[[Krog alloc] initKrog:physicsWorld]
            createKrog:0]];
    [enemies addObject:[[[Krog alloc] initKrog:physicsWorld]
            createKrog:0]];
    [enemies addObject:[[[Krog alloc] initKrog:physicsWorld]
            createKrog:1]];
    
    for (int i = 0; i < enemies.count; i++) {
        CGFloat posx = ((arc4random() % 6) * 50) + 250;
        CGFloat posy = ((arc4random() % 6) * 50) + 250;
        
        [enemies[i] setPos:ccp(posx, posy)];
        [self addChild:enemies[i]];
    }
}

-(void)startNextBackground:(NSInteger)index
{
    
}

-(void)startRemovingCoin:(Coin* )coin
{
    [self._pickableCache removeChild:coin];
}

-(void)startRemovingBalloon:(Balloon* )balloon
{
    [self._pickableCache removeChild:balloon];
}

-(void)startGameOverScene:(BOOL)won
{
    GameOverScene* gameOverScene = [GameOverScene scene];
    [[CCDirector sharedDirector] replaceScene:gameOverScene
                               withTransition:[CCTransition
                  transitionPushWithDirection:CCTransitionDirectionDown
                                     duration:2.0f]];
    [gameOverScene showGameMessage:won];
}

@end