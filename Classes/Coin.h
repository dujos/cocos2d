#import <Foundation/Foundation.h>

#import "Entity.h"

@interface Coin : Entity
{
    
}

@property(nonatomic) CCSprite* coinSprite;

-(id)initCoin:(CCPhysicsNode* )world;

-(id)initCoin:(CCPhysicsNode* )world
     velocity:(CGPoint)velocity;

-(void)setPos:(CGPoint)pos;

-(void)checkCollision;

@end
