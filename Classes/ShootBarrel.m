#import "ShootBarrel.h"

@implementation ShootBarrel

-(id)initShootBarrel:(CCPhysicsNode* )world
{
    self = [super initBarrel:world];
    
    self.name = @"shoot barrel";
    
    self._barrelSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"shoot.png"]];
    
    [self loadAnimations];
    [self addChild:self._barrelSprite z:0.f name:self._name];
    
    self._velocity = ccp(1.f, 1.f);
    [self createBarrelMovement];
    
    //[self initBody:shootBarrelSprite collision:self.name];
    return self;
}

-(id)initShootBarrel:(float)startRotation
                 pos:(CGPoint)point
        physicsWorld:(CCPhysicsNode* )world;
{
    self = [self initShootBarrel:world];
    [self setPos:point];
    
    return self;
}

-(void)createBarrelMovement
{
    circleMovement = [[CircleMovement alloc] initCurve];
    circleMovement.sprite = self._barrelSprite;
    circleMovement.speed = ccpLengthSQ(self._velocity);
    circleMovement._radius = 10.f;
    
    [self addChild:circleMovement];
    [self startAnimation];
}

-(void)startAnimation
{
    [circleMovement startMovement];
}

-(void)loadAnimations
{
    [super loadAnimations];
}

-(void)setPos:(CGPoint)position
{
    [super setPos:position];
    [self._barrelSprite setPosition:position];
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];
    
    if (CGRectIntersectsRect([self._barrelSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        [super startExplosion];

        kong._velocity = ccpNormalize(kong._velocity);
        kong._velocity = ccpNeg(kong._velocity);
        
        /*
        CCColor* color = [CCColor colorWithRed:0.5f
                                         green:0.5f
                                          blue:0.5f
                                         alpha:1.0f];
        
        CCDrawNode* drawNode = [[CCDrawNode alloc] init];
        CGPoint destination = ccpMult(kong._velocity, 10.f);
        [drawNode drawSegmentFrom:ccp(self._barrelSprite.position.x,
                                      self._barrelSprite.position.y)
                               to:destination
                           radius:2.f
                            color:color];
        [self addChild:drawNode];
        */
    }
}

-(void)update:(CCTime)delta
{
    [self setPos:self._barrelSprite.position];
    [self checkCollision];
}

@end