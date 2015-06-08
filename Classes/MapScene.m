#import "MapScene.h"

static MapScene* _mapScene = nil;

@implementation MapScene

+(MapScene *)scene
{
    if (!_mapScene)
    {
        _mapScene = [[self alloc] init];
        return _mapScene;
    }
    return _mapScene;
}

-(id)init
{
    self = [super init];
    if (!self)
        return(nil);
    
    
    physicsWorld = [CCPhysicsNode node];
    physicsWorld.gravity = ccp(0.f, 0.f);
    [self addChild:physicsWorld];
    
    return self;
}

-(void)startMap
{
}

@end