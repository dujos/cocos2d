#import "Banana.h"

#import "Kong.h"
#import "GameScene.h"
#import "HudLayer.h"

@implementation Banana

-(id)initBanana:(CCPhysicsNode* )world;
{
    self = [super initPickable:world];
    
    self.name = @"banana";
    self.move = NO;
    self._velocity = ccp(0.f, 0.f);
    self.currentState = noMovement;
    
    
    bananaSprite = [CCSprite spriteWithImageNamed:@"yb1.png"];
    [self addChild:bananaSprite];

    //self initBody:bananaSprite collision:self.name];
    return self;
}

-(id)initBanana:(CCPhysicsNode* )world
       velocity:(CGPoint)velocity
{
    self = [self initBanana:world];
    self._velocity = velocity;
    
    return self;
}

-(void)createBananaMovement
{
    circleMovement = [[CircleMovement alloc] initCurve];
    circleMovement.sprite = bananaSprite;
    circleMovement.speed = ccpLengthSQ(self._velocity);
    circleMovement._radius = 5.f;
        
    [self addChild:circleMovement];
    [self startMoveAnimation];
}

-(void)startMoveAnimation
{
    [self stopAllActions];
    [circleMovement startMovement:0.5f];
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
    CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.bananaAnimation];

    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];

    [bananaSprite runAction:repeatAnimation];
}

-(void)moveAnimation:(CGPoint)destination
{
    CCActionMoveTo* actionMove = [CCActionMoveTo actionWithDuration:12.f position:destination];
    [bananaSprite runAction:actionMove];
}

-(void)checkCollision
{
    HudLayer* hudlayer = [[GameScene scene] getHudLayer];
    Kong* kong = [[GameScene scene] getKong];
    
    if (CGRectIntersectsRect([bananaSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        CGPoint position = [hudlayer getCoinPos];
        [self moveAnimation:position];
    }
}

-(void)setPos:(CGPoint)pos
{
    [bananaSprite setPosition:pos];
}

-(void)setScale:(float)scale
{
    [bananaSprite setScale:scale];
}

-(void)onEnter
{
    [super onEnter];
    [self unscheduleAllSelectors];
    [self loadAnimations];
    [self startAnimation];
    
    if (ccpLengthSQ(self._velocity) > 0)
    {
        self.currentState = circularMovement;
        [self createBananaMovement];
    } else {
        self.currentState = noMovement;
    }
}

-(void)update:(CCTime)delta
{
    [self checkCollision];
}

@end