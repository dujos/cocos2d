#import "BalloonBarrel.h"

#import "Kong.h"
#import "GameScene.h"
#import "PickableCache.h"

@implementation BalloonBarrel

-(id)initBalloonBarrel:(CCPhysicsNode*)world
{
    self = [self initBarrel:world];
    currentIndex = 0;

    barrelSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"barrel.png"]];
    
    greenBalloon = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"greenb.png"]];
    [greenBalloon setVisible:YES];
    
    redBalloon = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"redb.png"]];
    [redBalloon setVisible:NO];
    
    collisionDetected = false;
    
    [self setPosition:barrelSprite.position];
    [self addChild:barrelSprite z:0 name:@"barrel sprite"];
    [self addChild:greenBalloon z:0 name:@"green balloon"];
    [self addChild:redBalloon z:0 name:@"red balloon"];
    
    [self startAnimation];
    
    return self;
}

-(void)checkCollision
{
    PickableCache* pickableCache = [[GameScene scene] getPickableCache];
    Kong* kong = [[GameScene scene] getKong];
    
    
    
    if (CGRectContainsPoint([barrelSprite boundingBox],
                            [kong.getKongSprite boundingBox].origin))
    {
        if (collisionDetected == false)
        {
            collisionDetected = true;
            
            float x = barrelSprite.position.x;
            float y = barrelSprite.position.y;
            
            CGPoint point = CGPointMake(x, y);
            
            for (int i = 0; i < 3; i++)
            {
                point = ccpAdd(point, ccp((i+1) * 50.f, 0.f));
                [pickableCache createPickables:point
                                            at:0
                                      velocity:ccp(0.f, 1.f)
                                         world:self._physicsWorld];
            }
        }
    }
}

-(void)start
{

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
