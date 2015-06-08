#import "cocos2d.h"
#import "cocos2d-ui.h"

#import "Sphere.h"

@interface MapScene : CCScene
{
    CCPhysicsNode* physicsWorld;
    Sphere* sphere;
}

+(MapScene* )scene;

-(id)init;

-(void)startMap;

@end