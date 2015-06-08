#import "BananaBarrel.h"
#import "Barrel.h"
#import "GameScene.h"
#import "Kong.h"
#import "PickableCache.h"
#import "HudLayer.h"

@implementation BananaBarrel

-(id)initBananaBarrel:(CCPhysicsNode*)world
{
    self = [self initBarrel:world];
    collisionDetected = false;
    
    barrelSprite = [CCSprite spriteWithImageNamed:
        [NSString stringWithFormat:@"barrel.png"]];
    
    bananaSprite = [CCSprite spriteWithImageNamed:
        [NSString stringWithFormat:@"banana.png"]];
    
    [self setPosition:barrelSprite.position];
    [self addChild:barrelSprite z:0 name:@"barrel sprite"];
    
    [self addChild:bananaSprite z:0 name:@"banana sprite"];
    [bananaSprite setScale:0.5f];
    
    [self loadAnimations];
    [self startAnimation];
    
    return self;
}

-(void)setPos:(CGPoint)position
{
    [barrelSprite setPosition:position];
    [bananaSprite setPosition:position];
}

-(void)checkCollision
{
    PickableCache* pickableCache = [[GameScene scene] getPickableCache];
    Kong* kong = [[GameScene scene] getKong];
    HudLayer* hudlayer = [[GameScene scene] getHudLayer];
    
    if (CGRectContainsPoint([barrelSprite boundingBox],
                            [kong.getKongSprite boundingBox].origin))
    {
        if (collisionDetected == false)
        {
            collisionDetected = true;
            CGPoint xy = ccpAdd(barrelSprite.position, ccp(100.f, 100.f));
            [pickableCache loadPickablesCircle:xy
                                        radius:200.f
                                         index:2
                                      velocity:ccp(2.f, 2.f)
                                         world:self._physicsWorld];
            
            [hudlayer startCountdown];
        }
    }

}

-(void)loadAnimations
{
    self.bananaAnimation = [self loadAnimation:8
                                    startFrame:1
                                         delta:0.1f
                                   animateName:@"yb"];
}

-(void)startAnimation
{
    CCActionAnimate* actionAnimate = [CCActionAnimate
                                      actionWithAnimation:self.bananaAnimation];
    
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
    
    [bananaSprite runAction:repeatAnimation];
}

-(void)update:(CCTime)delta
{
    [self checkCollision];
}

@end
