#import "Barrel.h"

@implementation Barrel

-(id)initBarrel:(CCPhysicsNode* )world;
{
    self = [super initEntity:world];
    
    explosionSprite = [CCSprite spriteWithImageNamed:[NSString  stringWithFormat:@"explosion.png"]];
    
    [explosionSprite setVisible:NO];
    [explosionSprite setScale:1.5f];
    
    [self addChild:explosionSprite z:10];
    
    movementBarrel = linear;
    return self;
}

-(void)loadAnimations
{
    explosionAnimation = [self loadAnimation:10
                                  startFrame:1
                                       delta:0.1f
                                 animateName:@"explosion"];
    
    bigExplosionAnimation = [self loadAnimation:1
                                     startFrame:1
                                          delta:0.1f
                                    animateName:@"bigexplosion"];
}

-(void)setPos:(CGPoint)position
{
    [explosionSprite setPosition:position];
}

-(void)removeSprite
{
    [explosionSprite setVisible:NO];
}

-(void)startExplosion
{
    [explosionSprite setVisible:YES];

    CCActionAnimate* actionExplosion = [CCActionAnimate actionWithAnimation:explosionAnimation];
    
    CCActionAnimate* actionBigExplosion = [CCActionAnimate actionWithAnimation:bigExplosionAnimation];
    
    id removeSpriteAction = [CCActionCallFunc
                             actionWithTarget:self
                                     selector:@selector(removeSprite)];
    
    [explosionSprite runAction:[CCActionSequence
        actions:actionExplosion,
                actionBigExplosion,
                removeSpriteAction, nil]];
}

@end