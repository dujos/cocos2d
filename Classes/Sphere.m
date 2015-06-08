#import "Sphere.h"

@implementation Sphere

-(id)initSphere
{
    self = [super init];
    
    //self.sphere = [CCSprite spriteWithImageNamed:@"barrel.png"];
    //[self addChild:self.sphere];
    
    CCPhysicsBody *body = [CCPhysicsBody
        bodyWithCircleOfRadius:self.sphere.contentSize.width
                     andCenter:CGPointZero];
    self.physicsBody = body;
    body.friction = 1.f;
    body.elasticity = 1.f;
    
    body.collisionCategories = @[@"sphere"];
    body.collisionMask = @[@"sphere", @"outline"];
    
    return self;
}

@end