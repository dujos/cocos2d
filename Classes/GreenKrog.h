#import <Foundation/Foundation.h>

#import "Krog.h"

@interface GreenKrog : Krog
{
    CCSprite* gkSprite;
}

@property(nonatomic) CCAnimation* gkAnimation;
@property(nonatomic) CCSprite* _gkSprite;

-(id)initGreenKrog:(CCPhysicsNode* )world;

-(void)createGreenKrog;

-(void)setPos:(CGPoint)position;

-(void)loadAnimations;

-(void)checkCollision;

@end
