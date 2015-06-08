#import <Foundation/Foundation.h>

#import "Entity.h"

typedef enum MovementBarrel
{
    linear = 0,
    
} MovementBarrel;

@interface Barrel : Entity
{
    CCSprite* explosionSprite;
    
    CCAnimation* explosionAnimation;
    CCAnimation* bigExplosionAnimation;
    
    MovementBarrel movementBarrel;
}

-(id)initBarrel:(CCPhysicsNode* )world;

-(void)loadAnimations;

-(void)setPos:(CGPoint)position;

-(void)startExplosion;

-(void)removeSprite;

@end
