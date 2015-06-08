#import <Foundation/Foundation.h>

#import "Entity.h"
#import "Movement.h"
#import "GameScene.h"

@class Movement;

typedef enum KongState
{
    shake = 0,
    move = 1,
    dead = 2,
    stop = 3,
    freemove = 4
    
} KongState;

@interface Kong : Entity
{
    CCSprite* donkeySprite;
    CCSprite* diddySprite;
    Movement* movement;
    CCPhysicsNode* physicsWorld;
    
    int life;
}

@property(nonatomic) CCAnimation* donkeyStandAnimation;
@property(nonatomic) CCAnimation* donkeyShakeAnimation;
@property(nonatomic) CCAnimation* donkeyDeadAnimation;
@property(nonatomic) CCAnimation* donkeyMoveAnimation;
@property(nonatomic) CCAnimation* donkeyFreeMoveAnimation;

@property(nonatomic) CCAnimation* diddyStandAnimation;
@property(nonatomic) CCAnimation* diddyMoveAnimation;

@property(nonatomic) CCSprite* _kongSprite;

@property(nonatomic) BOOL _barrel;
@property(nonatomic) BOOL _canMoveFree;
@property(nonatomic) CGPoint _spriteOffset;
@property(nonatomic) int  _currentSprite;

@property(nonatomic) KongState currentState;

-(id)init:(CCPhysicsNode* )world;

-(CCSprite* )getKongSprite;

-(void)setPos:(CGPoint)position;

-(void)startAnimation:(KongState)state;
-(void)loadAnimations;
-(void)loadSprites;

-(void)hideKongSprites;
-(void)showKongSprites;

-(void)createKongMovement;
-(Movement* )getMovement;

-(CGRect)getCoinRect;

-(void)startStand;
-(void)startShake;
-(void)startDead;
-(void)startMove;
-(void)startFreeMove;

@end