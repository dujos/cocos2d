#import "Barrel.h"
#import "Kong.h"
#import "FreeMovement.h"

typedef enum Rotation
{
    stopRotation = 0,
    left,
    right,
    halfCircle,
    quarterCircle,
    
} Rotation;

@interface FireBarrel : Barrel
{
    CCSprite* fireBarrelSprite;
    
    Rotation barrelRotation;
    float rotationStart;
    float rotationSpeed;
    
    FreeMovement* freeMovement;
}

@property(nonatomic) CGPoint _startPoint;
@property(nonatomic) CGPoint _endPoint;

-(id)initFireBarrel:(CCPhysicsNode* )world;

-(id)initFireBarrel:(float)startRotation
      startPosition:(CGPoint)spos
        endPosition:(CGPoint)epos
           rotation:(int)br
       physicsWorld:(CCPhysicsNode* )world;

-(void)setPos:(CGPoint)position;
-(void)setStartPos:(CGPoint)start setEndPos:(CGPoint)end;

-(void)createFireBarrelMovement;

-(void)loadAnimations;

-(void)setRotationSpeed:(float)rotationSpeed;

-(void)setRotation:(Rotation)rotation;

-(void)checkCollision;

-(void)rotate;

@end