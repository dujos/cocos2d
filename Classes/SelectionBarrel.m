#import "SelectionBarrel.h"


@implementation SelectionBarrel

-(id) initBalloonBarrel:(CCPhysicsNode*)world;
{
    self = [self initBarrel:world];
    
    barrelSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"barrel.png"]];
    
    greenBalloon = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"greenb.png"]];
    [greenBalloon setVisible:YES];
    
    redBalloon = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"redb.png"]];
    [redBalloon setVisible:NO];
    
    [self setPosition:barrelSprite.position];
    [self addChild:barrelSprite];
    [self addChild:greenBalloon];
    [self addChild:redBalloon];
    
    currentIndex = 0;
    
    //    [self startAnimation];
    
    return self;
}

-(void)checkCollision
{
    
}

-(void)start
{
    if (currentIndex % 2 == 0) {
        [greenBalloon setVisible:YES];
        [redBalloon setVisible:NO];
        currentIndex += 1;
    } else {
        [greenBalloon setVisible:NO];
        [redBalloon setVisible:YES];
        currentIndex -= 1;
    }
}

-(void)startAnimation
{
    [self schedule:@selector(start) interval:2.f];
}

-(void)setPos:(CGPoint)position
{
    [barrelSprite setPosition:position];
    [greenBalloon setPosition:position];
    [redBalloon setPosition:position];
}

-(void)update:(CCTime)delta
{
    [self checkCollision];
}


@end
