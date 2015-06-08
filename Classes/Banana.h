#import "Pickable.h"
#import "CircleMovement.h"

typedef enum BananaState
{
    noMovement = 0,
    circularMovement = 1
    
} BananaState;

@interface Banana : Pickable
{
    NSArray* actions;
    CCSprite* bananaSprite;
    CCPhysicsNode* physicsWorld;
    
    CircleMovement* circleMovement;
}

@property(nonatomic) BananaState currentState;

@property(nonatomic) CCAnimation* bananaAnimation;

@property(nonatomic) BOOL move;

-(id)initBanana:(CCPhysicsNode* )world;
-(id)initBanana:(CCPhysicsNode* )world
       velocity:(CGPoint)velocity;

-(void)createBananaMovement;

-(void)loadAnimations;

-(void)startMoveAnimation;

-(void)startAnimation;

-(void)moveAnimation:(CGPoint)destination;

-(void)setPos:(CGPoint)pos;

-(void)setScale:(float)scale;

-(void)checkCollision;

@end
