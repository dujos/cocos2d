#import "FireBarrel.h"

#import "Kong.h"
#import "GameScene.h"

@implementation FireBarrel

-(id)initFireBarrel:(CCPhysicsNode* )world;
{
    self = [super initBarrel:world];
    
    fireBarrelSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"barrel.png"]];
    
    self.name = @"fire barrel";
    self._velocity = ccp(0.f, 0.f);
    
    [self loadAnimations];
     
    fireBarrelSprite.rotation = 0.f;
    rotationSpeed = 2.5f;
    barrelRotation = 0;
    
    [self setStartPos:CGPointMake(0.f, 0.f)
            setEndPos:CGPointMake(0.f, 0.f)];

    [self addChild:fireBarrelSprite z:10 name:self._name];

    //[self initBody:fireBarrelSprite collision:self.name];
    return self;
}

-(id)initFireBarrel:(float)startRotation
      startPosition:(CGPoint)spos
        endPosition:(CGPoint)epos
           rotation:(int)rotation
       physicsWorld:(CCPhysicsNode* )world
{
    self = [self initFireBarrel:world];
    self._velocity = ccp(1.f, 1.f);
    
    fireBarrelSprite.rotation = startRotation;
    [self setStartPos:spos setEndPos:epos];
    barrelRotation = rotation;
    [self createFireBarrelMovement];
    
    return self;
}

-(void)loadAnimations
{
    [super loadAnimations];
}

-(void)setRotationSpeed:(float)rs
{
    rotationSpeed = rs;
}

-(void)setRotation:(Rotation)rotation
{
    barrelRotation = rotation;
}

-(void)setPos:(CGPoint)position
{
    [super setPos:position];
    [fireBarrelSprite setPosition:position];
}

-(void)setStartPos:(CGPoint)start setEndPos:(CGPoint)end
{
    [self setPos:start];

    self._startPoint = start;
    self._endPoint = end;
}

-(void)createFireBarrelMovement
{
    freeMovement = [[FreeMovement alloc] initFreeMovemet:self._startPoint
                                                     end:self._endPoint
                                                velocity:self._velocity];
    freeMovement.sprite = fireBarrelSprite;
    
    [self addChild:freeMovement];
    [freeMovement startMovement];
}

-(void)rotate
{
     if (barrelRotation == left)
     {
         if (fireBarrelSprite.rotation == 360)
         {
             fireBarrelSprite.rotation = 0;
         }
         fireBarrelSprite.rotation += rotationSpeed;
     } else if (barrelRotation == right) {
         if (fireBarrelSprite.rotation == 360)
         {
             fireBarrelSprite.rotation = 0;
         }
         fireBarrelSprite.rotation -= rotationSpeed;
     } else if (barrelRotation == halfCircle) {
         if (fireBarrelSprite.rotation > 180)
         {
             rotationSpeed *= -1;
         } else if (fireBarrelSprite.rotation < 0) {
             rotationSpeed *= -1;
         }
        fireBarrelSprite.rotation += rotationSpeed;
     } else if (barrelRotation == quarterCircle) {
         if (fireBarrelSprite.rotation > 90)
         {
             rotationSpeed *= -1;
         } else if (fireBarrelSprite.rotation < 0) {
             rotationSpeed *= -1;
         }
         fireBarrelSprite.rotation += rotationSpeed;
     } else if (barrelRotation == stopRotation) {
         fireBarrelSprite.rotation = 0;
     }
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];
    if (CGRectIntersectsRect([fireBarrelSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        if (!kong._barrel) {
            kong._barrel = YES;
            kong._canMoveFree = NO;
            kong._velocity = self._velocity;
            //CGPoint xy = ccpAdd(fireBarrelSprite.position,
            //        ccp(fireBarrelSprite.contentSize.width,
            //            fireBarrelSprite.contentSize.height));
            //kong.getKongSprite.position = xy;
            
            kong.getKongSprite.position = fireBarrelSprite.position;
        }
    }
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    Kong* kong = [[GameScene scene] getKong];
    kong._barrel = YES;
    
    if (kong._barrel) {
        self._velocity = ccp(sin(fireBarrelSprite.rotation),
                             cos(fireBarrelSprite.rotation));
        self._velocity = ccpNormalize(self._velocity);
        
        kong._velocity = ccpMult(self._velocity, 2);
        kong._barrel = NO;
//        [kong showKongSprites];
    }
}

-(void)onEnter
{
    [super onEnter];
}

-(void)update:(CCTime)delta
{
    [self setPos:fireBarrelSprite.position];
    [self checkCollision];
    [self rotate];
}

@end
