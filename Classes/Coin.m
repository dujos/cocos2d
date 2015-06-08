#import "Coin.h"

#import "Kong.h"
#import "GameScene.h"

@implementation Coin

-(id)initCoin:(CCPhysicsNode* )world;
{
    self = [super initEntity:world];

    self._name = @"coin";
    self.coinSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"coin.png"]];
    
    [self.coinSprite setPosition:ccp(300.f, 100.f)];
    
    //[self._physicsWorld addChild:self.coinSprite z:0 name:self._name];
    [self addChild:self.coinSprite];
    
    return self;
}

-(id)initCoin:(CCPhysicsNode* )world
     velocity:(CGPoint)velocity
{
    self = [self initCoin:world];
    self._velocity = velocity;
    return self;
}

-(void)createAt:(CGPoint)position
{
    //NSLog(@"create at");
    //[super createAt:position];
    //CGFloat angle = arc4random();
    //velocity = ccp(cosf(angle), sinf(angle));
}

-(void)changeAnimation
{
    /*
    index++;
    if (index >= 2)
    {
        index = 0;
    }

    [self stopAllActions];
    CCAnimation* tiles = [self load:6 sprite:@"kongtiles.png"];
    CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:tiles];
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
    */
}

-(void)onEnter
{
    [super onEnter];
    
    /*
    [self unscheduleAllSelectors];
    index = 0;
    
    CCAnimation* starAnimation = [self loadAnimation:4 startFrame:1 delta:0.2f animateName:@"star"];
    CCAnimation* dkAnimation =[self loadAnimation:4 startFrame:1 delta:0.2f animateName:@"dk"];

    actions =[[NSArray alloc] initWithObjects:starAnimation, dkAnimation, nil];
    
    CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:starAnimation];
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
     
    [self runAction:repeatAnimation];
    */
}

-(void)setPos:(CGPoint)pos
{
    [self.coinSprite setPosition:pos];
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];
    
    if (CGRectIntersectsRect([self.coinSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        if (!self._remove)
        {
            [[GameScene scene] startRemovingCoin:self];
            self._remove = YES;
        }
    }
}

-(void)update:(CCTime)delta
{
    [self checkCollision];
}

@end
