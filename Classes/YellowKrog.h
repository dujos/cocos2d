#import <Foundation/Foundation.h>

#import "Krog.h"

@interface YellowKrog : Krog
{
    CCSprite* ykSprite;
}

@property(nonatomic) CCAnimation* ykAnimation;
@property(nonatomic) CCSprite* _ykSprite;

-(id)initYellowKrog:(CCPhysicsNode* )world;

-(void)setPos:(CGPoint)position;

-(void)loadAnimations;

-(void)checkCollision;

@end
