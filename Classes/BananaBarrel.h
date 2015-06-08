#import <Foundation/Foundation.h>

#import "Barrel.h"

@interface BananaBarrel : Barrel
{
    CCSprite* barrelSprite;
    CCSprite* bananaSprite;
    
    BOOL collisionDetected;
}

@property(nonatomic) CCAnimation* bananaAnimation;

-(id)initBananaBarrel:(CCPhysicsNode*)world;

-(void)setPos:(CGPoint)position;

-(void)checkCollision;

-(void)loadAnimations;

-(void)startAnimation;

@end
