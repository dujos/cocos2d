#import "Object.h"

@implementation Object

-(void)initObject
{
    friction = 0.25f;
    elasticity = 1.0f;
    
    normalMass = 1.0f;
    swingingMass = 1.0f;
    movingMass = 50.f;
    
    particleScale = 0.40f;
    particleDisplacement = 0.55f;
}

-(void)addPhysicsWorld:(CCPhysicsNode* )pw
{
    physicsWorld = pw;
}

@end