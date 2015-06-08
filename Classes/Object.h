#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface Object : CCNode
{
    CCPhysicsNode* physicsWorld;

    float normalMass;
    float swingingMass;
    float movingMass;
    
    float friction;
    float elasticity;
    
    float particleScale;
    float particleDisplacement;
}

-(void)initObject;

-(void)addPhysicsWorld:(CCPhysicsNode* )pw;

@end
