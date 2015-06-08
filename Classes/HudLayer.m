#import "HudLayer.h"
#import "GameScene.h"

#import "CCSprite.h"
#import "CCAnimation.h"

@implementation HudLayer

-(id)initHud:(int)index
{
    self = [super init];
    if (!self)
        return(nil);
    
    size = [[CCDirector sharedDirector] viewSize];
    offset = 175.f;
    digitOffset = 50.f;
    
    self._index = index;
    
    tokenPosition = ccp(50.f, size.height - offset);
    coinPosition = ccp(150.f, size.height - offset);
    wdonkeyPosition = ccp(350.f, size.height - offset);
    gdonkeyPosition = ccp(450.f, size.height - offset);
    
    [self loadToken];
    [self loadCoin];
    [self loadCountdown];
    [self loadSelections];
    [self loadAnimations];
    
    return self;
}

-(id)initHud
{
    self = [self initHud:0];
    return self;
}

-(void)hideSelectionBox:(int)index
{
    if ((index % 2) == 0)
    {
        [select setPosition:gdonkey.position];
        [wdonkey setVisible:NO];
    } else {
        [select setPosition:wdonkey.position];
        [gdonkey setVisible:NO];
    }
}

-(void)startBlinkingAnimation
{
    //CCActionBlink* blinkAction = [[CCActionBlink alloc] initWithDuration:5.f
    //                                                              blinks:10];
    //[countdown[countdownIndex] runAction:blinkAction];
    [countdown[countdownIndex] setVisible:NO];
}

-(void)startCountdownAnimation
{
    if (self._loop == YES)
    {
        if (countdownIndex > 0)
        {
            [countdown[countdownIndex] setVisible:NO];
            countdownIndex -= 1;
            [countdown[countdownIndex] setVisible:YES];
        } else {
            self._loop = NO;
            [self startBlinkingAnimation];
            [self unschedule:@selector(startCountdownAnimation)];
        }
    }
}

-(void)startCountdown
{
    [self schedule:@selector(startCountdownAnimation) interval:1.f];
}

-(void)loadCountdown
{
    countdownIndex = 9;
    self._loop = YES;
    CGPoint position = CGPointMake(size.width/2.f,
                                   size.height-150);
    
    countdown = [[NSMutableArray alloc] init];
    countdown = [self loadNumbers:0
                              end:10
                        spritName:@"0"
                         position:position];
    
    for (int i = 0; i < countdown.count; i++)
    {
        [self addChild:countdown[i]];
        //[countdown[i] setScale:2.f];
        [countdown[i] setVisible:NO];

        /*
        if (countdownIndex == i)
        {
            [countdown[i] setVisible:YES];
        } else {
            [countdown[i] setVisible:NO];
        }
        */
    }
}


-(void)setSelectionIndex:(int)index
{
    self._index = index;
}

-(void)loadSelections
{
    wdonkey = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"wdonkey.png"]];
    [wdonkey setPosition:wdonkeyPosition];
    [self addChild:wdonkey];
    
    gdonkey = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"gdonkey.png"]];
    [gdonkey setPosition:gdonkeyPosition];
    [self addChild:gdonkey];
    
    select = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"selection.png"]];
    
    if (self._index == 0) {
        [select setPosition:wdonkey.position];
    } else {
        [select setPosition:gdonkey.position];
    }
    [self addChild:select];
}

-(void)loadToken
{
    tokenSprite = [self loadSprite:@"token.png"
                          position:tokenPosition];
    float x = tokenSprite.position.x;
    float y = tokenSprite.position.y;

    tokens = [[NSMutableArray alloc] init];
    tokens = [self loadNumbers:1
                           end:10
                     spritName:@""
                      position:ccp(x, y)];

    tokenIndex = 0;
    tokenDigitSprite = tokens[tokenIndex];
    [tokenDigitSprite setScale:0.40f];
    [tokenDigitSprite setPosition:ccp(digitOffset + x, y)];
    [self addChild:tokenDigitSprite z:1 name:@"token digit sprite"];
}

-(void)loadCoin
{
    coinSprite = [self loadSprite:@"coin.png"
                         position:coinPosition];

    float x = coinSprite.position.x;
    float y = coinSprite.position.y;

    coins = [[NSMutableArray alloc] init];
    coins = [self loadNumbers:1
                          end:10
                    spritName:@""
                     position:ccp(x, y)];
    
    coinIndex = 0;
    coinDigitSprite = coins[coinIndex];
    [coinDigitSprite setScale:0.40f];
    [coinDigitSprite setPosition:ccp(digitOffset + x, y)];
    [self addChild:coinDigitSprite z:1 name:@"coin digit sprite"];
}

-(void)loadAnimations
{
    tokenAnimation = [self loadAnimation:8 startFrame:1 delta:0.5f
                                          animateName:@"token"];
    coinAnimation = [self loadAnimation:8 startFrame:1 delta:0.5f
                                         animateName:@"coin"];
}

-(CCSprite* )loadSprite:(NSString* )spriteName
               position:(CGPoint)location
{
    CCSprite* sprite = [CCSprite spriteWithImageNamed:spriteName];
    [sprite setPosition:CGPointMake(location.x, location.y)];
    [self addChild:sprite];
    return sprite;
}

-(CCAnimation* )loadAnimation:(NSInteger)frameSize startFrame:(NSInteger)startFrame delta:(CGFloat)delta sprite:(NSString* )spriteName spriteWidth:(GLfloat)width spriteHeight:(GLfloat)height
{
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:frameSize];
    for (int i = 0; i < frameSize; i++) {
        CCSpriteFrame* frame =[CCSpriteFrame frameWithTexture:[CCTexture textureWithFile:spriteName] rectInPixels:CGRectMake(i * width, 0, width, height) rotated:NO offset:CGPointZero originalSize:CGSizeMake(width, height)];
        [frames addObject:frame];
    }
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:frames delay:delta];
    return animation;
}

-(CCAnimation* )loadAnimation:(NSInteger)frameSize startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta animateName:(NSString* )animateName;
{
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:frameSize];
    for (int i = startFrame; i < frameSize; i++) {
        CCSpriteFrame* frame = [CCSpriteFrame frameWithImageNamed:[animateName stringByAppendingFormat:@"%d.png", i]];
        [frames addObject:frame];
    }
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:frames delay:delta];
    return animation;
}

-(void)startAnimation:(CCSprite* )sprite
{
    CCActionAnimate* actionAnimate = [CCActionAnimate
                                      actionWithAnimation:[self
                                            loadAnimation:8
                                               startFrame:0
                                                    delta:1.f
                                                   sprite:@"tombstone.png"
                                              spriteWidth:30
                                             spriteHeight:30]];
    
    CCActionRepeatForever* repeatAnimation = [CCActionRepeatForever actionWithAction:actionAnimate];
    [sprite runAction:repeatAnimation];
}

-(NSMutableArray* )loadNumbers:(int)start
                           end:(int)end
                     spritName:(NSString*)name
                      position:(CGPoint)point;
{
    NSMutableArray* digits = [[NSMutableArray alloc] init];
    for(int i = start; i < end; i++)
    {
        CCSprite* frame = [CCSprite spriteWithImageNamed:
            [name stringByAppendingString:[NSString
                         stringWithFormat:@"%d.png", i]]];
        [frame setPosition:point];
        [digits addObject:frame];
    }
    return digits;
}

-(CGPoint)getCoinPos
{
    return coinSprite.position;
}

-(CGPoint)getTokenPos
{
    return tokenSprite.position;
}

-(void)updateCoin
{
    [self removeChildByName:@"coinDigitSprite"];
    
    coinIndex += 1;
    coinDigitSprite = coins[coinIndex];
    [coinDigitSprite setScale:0.40f];
    float x = coinSprite.position.x;
    float y = coinSprite.position.y;
    [coinDigitSprite setPosition:ccp(25.f + x, y)];
    [self addChild:coinDigitSprite z:1 name:@"coinDigitSprite"];
}

-(void)updateToken
{
    tokenIndex += 1;
}

@end