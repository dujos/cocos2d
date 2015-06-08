#import <Foundation/Foundation.h>

#import "Pickable.h"

@interface Balloon : Pickable
{
    NSArray* actions;
    CCSprite* balloonSprite;
    CCSprite* explosionSprite;
    CCPhysicsNode* physicsWorld;
    
    NSArray* balloonNames;
    
    NSString* currentBalloon;
}

@property(nonatomic)CCAnimation* explosionAnimation;
@property(nonatomic)CCAnimation* bigExplosionAnimation;

-(void)loadAnimations;

-(id)initBalloon:(CCPhysicsNode* )world;

-(id)initBalloon:(CCPhysicsNode *)world
        velocity:(CGPoint)velocity;

-(id)initBalloon:(CCPhysicsNode *)world
      spriteName:(NSString* )sprite;

-(void)loadBalloonNames;

-(void)removeSprite;

-(void)startExplosion;

-(void)changeAnimation;

-(void)setPos:(CGPoint)pos;

-(void)checkCollision;

@end
