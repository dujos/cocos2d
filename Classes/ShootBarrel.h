#import "Barrel.h"
#import "Kong.h"
#import "GameScene.h"

#import "CircleMovement.h"

@interface ShootBarrel : Barrel
{
    CircleMovement* circleMovement;
}

@property(nonatomic)CCSprite* _barrelSprite;

@property(nonatomic)float _radius;
@property(nonatomic)float _circumference;

-(id)initShootBarrel:(CCPhysicsNode* )world;

-(id)initShootBarrel:(float)startRotation
                 pos:(CGPoint)position
        physicsWorld:(CCPhysicsNode* )world;

-(void)createBarrelMovement;

-(void)startAnimation;

-(void)loadAnimations;

-(void)setPos:(CGPoint)position;

-(void)checkCollision;

@end
