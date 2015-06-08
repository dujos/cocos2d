#import "Krog.h"
#import "GameScene.h"

#import "GreenKrog.h"
#import "YellowKrog.h"


@implementation Krog

-(id)initKrog:(CCPhysicsNode* )world;
{
    self = [super initEnemy:world];
    
    startPosition = ccp(100.f, 100.f);
    currentPosition = startPosition;
    self._name = @"krog";

    return self;
}

-(id)createKrog:(int)index
{
    if (index == 0) {
        return [[GreenKrog alloc] initGreenKrog:self._physicsWorld];
    } else if (index == 1) {
        return [[YellowKrog alloc] initYellowKrog:self._physicsWorld];
    }
    return nil;
}

-(id)create
{
    return nil;
}

-(void)checkCollision:(CCSprite* )sprite;
{
    Kong* kong = [[GameScene scene] getKong];
    HudLayer* hudLayer = [[GameScene scene] getHudLayer];
    
    if (CGRectIntersectsRect([sprite boundingBox], [kong.getKongSprite boundingBox]))
    {
        [hudLayer hideSelectionBox:kong._currentSprite];
    }
}

-(void)selectMovement:(int)emove
{
    if (emove == 0) {
        [self moveKrog1];
    } else if (emove == 1) {
        [self moveKrog2];
    }
}

-(void)moveKrog1
{
    if (currentPosition.x < 99) {
        self._velocity = ccpNormalize(ccp(1.f, -1.f));
    } else {
        self._velocity = ccpNormalize(ccp(1.f, -1.f));
    }
}

-(void)moveKrog2
{
    CGPoint v = ccpSub(currentPosition, startPosition);

    if (currentPosition.x < 99) {
        v = ccpPerp(v);
    } else {
        v = ccpRPerp(v);
    }
    self._velocity = ccpNormalize(v);
}

-(void)moveKrog3
{
    CGPoint v;
    if (currentPosition.x < 99) {
        v = ccpSub(ccp((currentPosition.x - 360), currentPosition.y), startPosition);
        v = ccpPerp(v);
    } else {
        v = ccpSub(ccp((currentPosition.x + 360), currentPosition.y), startPosition);
        v = ccpRPerp(v);
    }
    self._velocity = ccpNormalize(v);
}

-(void)moveKrog4
{
    self._velocity = ccp(0, -1);
}

-(void)moveKrog5
{
    if (ccpDistance(currentPosition, startPosition) < 5) {
        self._velocity = CGPointZero;
        self._velocity = [self nextMove];
    }
}

-(CGPoint)nextMove
{
    NSInteger index = arc4random() % 3;
    CGPoint nextPoint;
    
    if (index == 0) {
        nextPoint = ccp(0, 0);
    } else if (index == 1) {
        nextPoint = ccp(0, 0);
    } else if (index == 2) {
        nextPoint = ccp(0, 0);
    } else if (index == 3) {
        nextPoint = ccp(0, 0);
    }
    return CGPointZero;
}

@end
