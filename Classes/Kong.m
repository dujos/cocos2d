#import "Kong.h"

#import "CCActionInterval.h"
#import "CCAnimation.h"

@implementation Kong

-(id)init:(CCPhysicsNode* )world;
{
    self = [super initEntity:world];
    
    self._velocity = ccp(0.f, 0.f);
    self._barrel = NO;
    self._canMoveFree = YES;
    self.name = @"kong";
    
    self._currentSprite = 0;
    self._spriteOffset = CGPointMake(-50.f, 0.f);
    self.currentState = stop;
    life = 2;
    
    diddySprite = [CCSprite spriteWithImageNamed:[NSString
                                stringWithFormat:@"did.png"]];
    donkeySprite = [CCSprite spriteWithImageNamed:
                    [NSString stringWithFormat:@"kong.png"]];
    
    [self initBody:donkeySprite
      secondSprite:diddySprite
         collision:self.name];

    [self loadAnimations];
    [self startAnimation:move];
    [self createKongMovement];
    
    //[self addChild:donkeySprite z:10];
    //[self addChild:diddySprite z:10];
    
    return self;
}

-(CCSprite* )getKongSprite
{
    return donkeySprite;
}

-(void)setPos:(CGPoint)position
{
    if (fabs(self._velocity.x) > 0.1f) {
        if (self._velocity.x > 0.1f) {
            donkeySprite.flipX = NO;
        } else {
            donkeySprite.flipX = YES;
        }
    }
    
    CGPoint offset = ccpAdd(position, self._spriteOffset);

    if (self._currentSprite == 0) {
        [donkeySprite setPosition:position];
        [diddySprite setPosition:offset];
    } else if (self._currentSprite == 1) {
        [donkeySprite setPosition:offset];
        [diddySprite setPosition:position];
    }
    
    if ([self isOutsideArea:donkeySprite])
    {
        movement._velocity = ccp(0.f, 0.f);
        self._velocity = movement._velocity;
        [self startDead];
        
        GameScene* gameScene = [GameScene scene];
        [gameScene startGameOverScene:YES];
    }
}

-(void)startAnimation:(KongState)state
{
    if (self.currentState != state) {
        self.currentState = state;
        if (self.currentState == dead) {
            [self startDead];
        } else if (self.currentState == stop) {
            [self startStand];
        } else if (self.currentState == shake) {
            [self startShake];
        } else if (self.currentState == move) {
            [self startMove];
        } else if (self.currentState == freemove) {
        }
    }
}

-(void)loadSprites
{
}

-(void)loadAnimations
{
    self.donkeyStandAnimation = [self loadAnimation:4
                                         startFrame:1
                                              delta:0.5f
                                        animateName:@"kongstanding"];
    
    self.donkeyShakeAnimation = [self loadAnimation:5
                                         startFrame:1
                                              delta:0.5f
                                        animateName:@"kongshaking"];
        
    self.donkeyDeadAnimation = [self load:1
                                   sprite:@"kongdead.png"];
    
    self.donkeyMoveAnimation = [self loadAnimation:16
                                        startFrame:1
                                             delta:0.05f
                                       animateName:@"kongmoving"];
    
    self.donkeyFreeMoveAnimation = [self loadAnimation:6
                                            startFrame:1
                                                 delta:0.05f
                                           animateName:@"kongfreemove"];
    
    self.diddyStandAnimation = [self loadAnimation:6
                                        startFrame:1
                                             delta:0.5f
                                       animateName:@"didstanding"];

    self.diddyMoveAnimation = [self loadAnimation:10
                                       startFrame:1
                                            delta:0.5f
                                      animateName:@"didmoving"];
}

-(void)hideKongSprites
{
    [donkeySprite setVisible:NO];
    [diddySprite setVisible:NO];
}

-(void)showKongSprites
{
    [donkeySprite setVisible:YES];
    [diddySprite setVisible:YES];
}

-(void)createKongMovement
{
    movement = [[Movement alloc] initMovement];
    movement.kong = self;
    [self addChild:movement];
}

-(Movement* )getMovement
{
    return movement;
}

-(CGRect)getCoinRect
{
    return CGRectMake(self.position.x-10,
                      self.position.y-10, 20, 20);
}

-(void)update:(CCTime)delta
{
    [self setPos:ccpAdd(donkeySprite.position, self._velocity)];
}

-(void)startMove
{
    [self stopAllActions];
    NSLog(@"move");
    CCActionAnimate* donkeyAction = [CCActionAnimate
        actionWithAnimation:self.donkeyMoveAnimation];
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever
        actionWithAction:donkeyAction];
    [donkeySprite runAction:repeatAnimation];
        
    CCActionAnimate* diddyAction = [CCActionAnimate actionWithAnimation:self.diddyMoveAnimation];
    repeatAnimation = [CCActionRepeatForever actionWithAction:diddyAction];
    [diddySprite runAction:repeatAnimation];
}

-(void)startDead
{
    [self stopAllActions];
    NSLog(@"dead");
    if (life > 0) {
        CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.donkeyDeadAnimation];
        [donkeySprite runAction:actionAnimate];
    }
}

-(void)startStand
{
    [self stopAllActions];
    NSLog(@"stand");
    if (life > 0) {
        CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.donkeyStandAnimation];
        CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
        [donkeySprite runAction:repeatAnimation];
    }
}

-(void)startShake
{
    [self stopAllActions];
    NSLog(@"shake");
    if (life > 0) {
        CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.donkeyShakeAnimation];
        CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
        [donkeySprite runAction:repeatAnimation];
    }
}

-(void)startFreeMove
{
    /*
    [self stopAllActions];
    NSLog(@"free move");
    if (life > 0) {
        CCActionAnimate* actionAnimate = [CCActionAnimate actionWithAnimation:self.donkeyFreeMoveAnimation];
        CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
        [donkeySprite runAction:repeatAnimation];
    }
    */
}

@end