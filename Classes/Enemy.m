#import "Enemy.h"
#import "PickableCache.h"
#import "GameScene.h"

@implementation Enemy

-(id)initEnemy:(CCPhysicsNode* )world;
{
    self = [super initEntity:world];
    return self;
}


@end
