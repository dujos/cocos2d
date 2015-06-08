#import "Pickable.h"

@implementation Pickable

-(id)initPickable:(CCPhysicsNode* )world;
{
    self = [super initEntity:world];
    return self;
}

-(void)update:(CCTime)delta
{
}

@end
