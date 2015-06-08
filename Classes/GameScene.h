#import "cocos2d.h"
#import "cocos2d-ui.h"

#import "EnemyCache.h"
#import "HudLayer.h"
#import "Kong.h"
#import "KongTile.h"
#import "Krog.h"
#import "LevelController.h"
#import "PickableCache.h"
#import "GameOverScene.h"
#import "Coin.h"
#import "Banana.h"
#import "BalloonBarrel.h"
#import "BananaBarrel.h"

@class Kong;

@interface GameScene : CCScene
{
    CCPhysicsNode* physicsWorld;
    
    NSInteger kongPoint;
    NSInteger kongType;
    NSInteger gameLevel;
    
    NSMutableArray* enemies;
    
    NSMutableArray* fireBarrels;
    NSMutableArray* shootBarrels;
    NSDictionary* allBarrels;
    
    NSMutableArray* coins;
}

+(GameScene* )scene;
-(id)init;

@property(nonatomic) Kong* kong;
@property(nonatomic) PickableCache* _pickableCache;
@property(nonatomic) EnemyCache* _enemyCache;
@property(nonatomic) HudLayer* _hudLayer;
@property(nonatomic) Coin* _coin;
@property(nonatomic) Balloon* _balloon;
@property(nonatomic) KongTile* _kongTile;

@property(nonatomic) BalloonBarrel* _balloonBarrel;
@property(nonatomic) BananaBarrel* _bananaBarrel;

-(Kong*)getKong;
-(PickableCache* )getPickableCache;
-(EnemyCache* )getEnemyCache;
-(HudLayer* )getHudLayer;
-(Coin* )getCoin;
-(BalloonBarrel*)getBalloonBarrel;

-(NSInteger)getKongType;
-(NSInteger)getLevel;

-(void)createBarrelCache;
-(void)createPickableCache;
-(void)createEnemyCache;

-(void)loadBananas;
-(void)loadCoins;
-(void)loadBarrels;
-(void)loadBalloons;

-(void)startGameLevel:(NSInteger)level
                 kong:(NSString* )selectKong
                index:(int)selection;

-(void)startGameLevel:(NSInteger)level
                 kong:(NSString* )selectKong;

-(void)startNextLevel;

-(void)startNextBackground:(NSInteger)index;

-(void)startGameOverScene:(BOOL)won;

-(void)startRemovingCoin:(Coin* )coin;
-(void)startRemovingBalloon:(Balloon* )balloon;

-(void)createSphere;

@end