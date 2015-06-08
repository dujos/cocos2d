#import <Foundation/Foundation.h>

#import "Barrel.h"
#import "GameScene.h"

@interface SelectionBarrel : Barrel
{
    CCSprite* barrelSprite;
    
    CCSprite* redBalloon;
    CCSprite* greenBalloon;
    
    int currentIndex;
}

-(id) initBalloonBarrel:(CCPhysicsNode*)world;

-(void)checkCollision;

-(void)start;

-(void)startAnimation;

-(void)setPos:(CGPoint)position;


@end
