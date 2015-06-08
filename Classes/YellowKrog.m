#import "YellowKrog.h"

@implementation YellowKrog : Krog

-(id)initYellowKrog:(CCPhysicsNode* )world;
{
    self = [super initKrog:world];

    self.name = @"yellowKrog";
    ykSprite.visible = YES;
    ykSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"yk.png"]];
    
    [self loadAnimations];
//    [self initBody:ykSprite collision:self.name];
    [self addChild:ykSprite];
    
    return self;
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];
    
    [super checkCollision:ykSprite];
    
    if (CGRectIntersectsRect([ykSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        [kong startDead];
    }
}

-(void)setPos:(CGPoint)position
{
    [ykSprite setPosition:position];
}

-(void)loadAnimations
{
    self.ykAnimation = [self loadAnimation:5 startFrame:1 delta:0.5f animateName:@"yk"];
    
    CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.ykAnimation];
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
    [ykSprite runAction:repeatAnimation];
}

@end
