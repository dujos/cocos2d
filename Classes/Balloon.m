#import "Balloon.h"
#import "Kong.h"
#import "GameScene.h"
#import "HudLayer.h"

@implementation Balloon

-(id)initBalloon:(CCPhysicsNode* )world;
{
    self = [super initPickable:world];
    
    [self loadBalloonNames];
    currentBalloon = @"br";
    self.name = @"balloon";
    self._velocity = ccp(0, 1);

    NSString* message = [currentBalloon stringByAppendingString:@".png"];
    balloonSprite = [CCSprite spriteWithImageNamed:message];
    
    explosionSprite = [CCSprite spriteWithImageNamed:[NSString  stringWithFormat:@"explosion.png"]];
    
    [explosionSprite setVisible:NO];
    [explosionSprite setScale:1.5f];

    [self loadAnimations];
    
    //[self initBody:balloonSprite collision:self.name];
    [self addChild:explosionSprite z:10];
    [self addChild:balloonSprite z:10];

    return self;
}

-(id)initBalloon:(CCPhysicsNode *)world
     velocity:(CGPoint)velocity
{
    self = [self initBalloon:world];
    self._velocity = velocity;
    return self;
}

-(id)initBalloon:(CCPhysicsNode *)world
      spriteName:(NSString* )sprite
{
    self = [super initPickable:world];
    
    [self loadBalloonNames];
    currentBalloon = sprite;
    self.name = @"balloon";
    self._velocity = ccp(0, 1);

    NSString* message = [currentBalloon stringByAppendingString:@".png"];
    balloonSprite = [CCSprite spriteWithImageNamed:message];
    
    explosionSprite = [CCSprite spriteWithImageNamed:[NSString  stringWithFormat:@"explosion.png"]];
    
    [explosionSprite setVisible:NO];
    [explosionSprite setScale:1.5f];
    
    [self loadAnimations];
    
    //[self initBody:balloonSprite collision:self.name];
    [self addChild:explosionSprite z:10];
    [self addChild:balloonSprite];
    
    return self;
}

-(void)loadAnimations
{
    self.explosionAnimation = [self loadAnimation:10
                                      startFrame:1
                                           delta:0.1f
                                     animateName:@"explosion"];
        
    self.bigExplosionAnimation = [self loadAnimation:1
                                         startFrame:1
                                              delta:0.1f
                                        animateName:@"bigexplosion"];
}

-(void)loadBalloonNames
{
    balloonNames = [[NSArray alloc] init];
    balloonNames = @[@"bg", @"br"];
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];
    HudLayer* hudlayer = [[GameScene scene] getHudLayer];
    
    if (CGRectIntersectsRect(balloonSprite.boundingBox, kong.getKongSprite.boundingBox))
    {
        if (!self._remove)
        {
            [balloonSprite setVisible:NO];
            [self startExplosion];
            self._remove = YES;
            
            [hudlayer updateCoin];
            [[GameScene scene] startRemovingBalloon:self];
        }
    }
}

-(void)removeSprite
{
    [explosionSprite setVisible:NO];
    [[GameScene scene] startRemovingBalloon:self];
}

-(void)startExplosion
{
    [explosionSprite setVisible:YES];
    
    CCActionAnimate* actionExplosion = [CCActionAnimate
        actionWithAnimation:self.explosionAnimation];
    
    CCActionAnimate* actionBigExplosion = [CCActionAnimate
        actionWithAnimation:self.bigExplosionAnimation];
    
    id removeSpriteAction = [CCActionCallFunc
                             actionWithTarget:self
                             selector:@selector(removeSprite)];
    
    [explosionSprite runAction:[CCActionSequence
                                actions:actionExplosion, actionBigExplosion, removeSpriteAction, nil]];
}

-(void)changeAnimation
{
    [self stopAllActions];
    
    int index = 0;
    if ([currentBalloon compare:@"br"]) {
        index = 1;
    } else {
        index = 0;
    }
    
    CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:actions[index]];
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
    
    [balloonSprite runAction:repeatAnimation];
}

-(void)setPos:(CGPoint)pos
{
    if ([super isOutsideArea:balloonSprite])
    {
//        [[GameScene scene] startRemovingBalloon:self];
//        self._remove = YES;
    }
    
    [balloonSprite setPosition:pos];
    [explosionSprite setPosition:pos];
}

-(void)onEnter
{
    [super onEnter];
    [self unscheduleAllSelectors];

    CCAnimation* brAnimation = [self loadAnimation:6 startFrame:1
                                             delta:0.2f
                                       animateName:@"br"];
    
    CCAnimation* bgAnimation = [self loadAnimation:6 startFrame:1
                                             delta:0.2f
                                       animateName:@"bg"];
     
    actions = [[NSArray alloc] initWithObjects:brAnimation,
                                               bgAnimation,
                                               nil];
    
    [self schedule:@selector(changeAnimation) interval:1.8f];
}

-(void)update:(CCTime)delta
{
    CGPoint position = ccpAdd(balloonSprite.position,
                              self._velocity);
    [self setPos:position];
    [self checkCollision];
    
}

@end
