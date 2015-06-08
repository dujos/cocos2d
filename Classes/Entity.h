#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

@interface Entity : CCNode
{
    CGRect rectangle;
}

@property(nonatomic) float _normalMass;
@property(nonatomic) float _swingMass;
@property(nonatomic) float _moveMass;

@property(nonatomic) float _friction;
@property(nonatomic) float _elasticity;

@property(nonatomic) CGPoint _velocity;

@property(nonatomic) CCPhysicsNode* _physicsWorld;
@property(nonatomic) CCPhysicsBody* _body;

@property(nonatomic) NSString* _name;

@property(nonatomic) BOOL _remove;

-(void)dealloc;

-(id)initEntity:(CCPhysicsNode* )world;
-(void)isInsideRectangle;

-(void)initBody:(CCSprite* )firstSprite
   secondSprite:(CCSprite* )secondSprite
      collision:(NSString* )collisionName;

-(void)initBody:(CCSprite* )sprite
      collision:(NSString* )collisionName;

-(CCAnimation* )loadAnimation:(NSInteger)frameSize
                   startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta
                  animateName:(NSString* )animateName;

-(CCAnimation* )loadAnimation:(NSInteger)frameSize
                   startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta
                       sprite:(NSString* )spriteName
                  spriteWidth:(GLfloat)width
                 spriteHeight:(GLfloat)height;

-(CCAnimation* )load:(NSInteger)frameSize sprite:(NSString* )spriteName;

-(BOOL)isOutsideArea:(CCSprite* )sprite;

@end
