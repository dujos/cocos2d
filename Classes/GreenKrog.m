#import "GreenKrog.h"
#import "Kong.h"

@implementation GreenKrog

-(id)initGreenKrog:(CCPhysicsNode* )world;
{
    self = [super initKrog:world];
    
    self.name = @"greenKrog";
    gkSprite.visible = YES;
    
    gkSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"gk.png"]];
    
    [self loadAnimations];
//    [self initBody:gkSprite collision:self.name];
    [self addChild:gkSprite];
    
    return self;
}

-(void)createGreenKrog
{

}

-(void)setPos:(CGPoint)position
{
    [gkSprite setPosition:position];
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];

    [super checkCollision:gkSprite];

    if (CGRectIntersectsRect([gkSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        [kong startDead];
    }
}

-(void)loadAnimations
{
    self.gkAnimation = [self loadAnimation:5 startFrame:1 delta:0.5f animateName:@"gk"];
    
    CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.gkAnimation];
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
    [gkSprite runAction:repeatAnimation];
}

-(void)update:(CCTime)delta
{
    [self checkCollision];
}

@end