#import <Foundation/Foundation.h>

#import "Barrel.h"


@interface BalloonBarrel : Barrel
{
    CCSprite* barrelSprite;
    
    CCSprite* redBalloon;
    CCSprite* greenBalloon;
    
    int currentIndex;
    
    BOOL collisionDetected;
}

-(id)initBalloonBarrel:(CCPhysicsNode*)world;

-(void)checkCollision;

-(void)start;

-(void)startAnimation;

-(void)setPos:(CGPoint)position;

@end
