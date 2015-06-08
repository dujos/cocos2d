#import "Entity.h"

#import "CCAnimation.h"

@implementation Entity

-(id)initEntity:(CCPhysicsNode* )world;
{
    self = [super init];
    if (self)
    {
        self._velocity = ccp(0.f, 0.f);
        self._name = @"entity";
        
        self._friction = 0.25f;
        self._elasticity = 1.0f;
        
        self._normalMass = 1.0f;
        self._swingMass = 1.0f;
        self._moveMass = 50.f;

        CGSize size = [[CCDirector sharedDirector] viewSize];
        rectangle = CGRectMake(-1.f, -1.f, size.width, size.height);
        
        self._physicsWorld = world;
        self._remove = NO;
    }
    return self;
}

-(void)dealloc
{
    
}

-(void)isInsideRectangle
{
    
}

-(void)initBody:(CCSprite* )firstSprite
   secondSprite:(CCSprite* )secondSprite
      collision:(NSString* )collisionName;
{
    self._body = [CCPhysicsBody bodyWithRect:firstSprite.boundingBox
                                cornerRadius:1.f];
    
    self._body.collisionCategories = @[collisionName];
    self._body.collisionMask = @[collisionName, collisionName];
    firstSprite.physicsBody.collisionGroup = collisionName;
    
    [firstSprite setPhysicsBody:self._body];

    [self._physicsWorld addChild:secondSprite];
    [self._physicsWorld addChild:firstSprite];
}

-(void)initBody:(CCSprite* )sprite
      collision:(NSString* )collisionName
{
    self._body = [CCPhysicsBody bodyWithRect:sprite.boundingBox
                                cornerRadius:1.f];
    
    self._body.collisionCategories = @[collisionName];
    self._body.collisionMask = @[collisionName, collisionName];
    sprite.physicsBody.collisionGroup = collisionName;
    
    [sprite setPhysicsBody:self._body];
    [self._physicsWorld addChild:sprite];
}

-(CCAnimation* )loadAnimation:(NSInteger)frameSize
                   startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta
                  animateName:(NSString* )animateName
{
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:frameSize];
    for (int i = startFrame; i < frameSize; i++)
    {
        CCSpriteFrame* frame = [CCSpriteFrame frameWithImageNamed:[animateName stringByAppendingFormat:@"%d.png", i]];
        [frames addObject:frame];
    }
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:frames
                                                              delay:delta];
    return animation;
}

-(CCAnimation* )loadAnimation:(NSInteger)frameSize
                   startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta
                       sprite:(NSString* )spriteName
                  spriteWidth:(GLfloat)width
                 spriteHeight:(GLfloat)height
{
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:frameSize];
    for (int i = 0; i < frameSize; i++)
    {
         CCSpriteFrame* frame =[CCSpriteFrame frameWithTexture:[CCTexture textureWithFile:spriteName] rectInPixels:CGRectMake(i * width, 0, width, height) rotated:NO offset:CGPointZero originalSize:CGSizeMake(width, height)];
        [frames addObject:frame];
    }
    
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:frames delay:delta];
    return animation;
}

-(CCAnimation* )load:(NSInteger)frameSize
              sprite:(NSString* )spriteName
{
    NSMutableArray* frames = [NSMutableArray arrayWithCapacity:frameSize];
    CCSpriteFrame* frame = [CCSpriteFrame frameWithImageNamed:spriteName];
    for (int i = 0; i < frameSize; i++) {
        [frames addObject:frame];
    }
    CCAnimation* animation = [CCAnimation animationWithSpriteFrames:frames delay:1];
    return animation;
}

-(BOOL)isOutsideArea:(CCSprite* )sprite
{
    return !CGRectContainsRect(rectangle, sprite.boundingBox);
}

-(void)onEnter
{
    [super onEnter];
}

@end