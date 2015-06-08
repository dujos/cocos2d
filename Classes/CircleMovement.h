#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

@interface CircleMovement : CCNode
{
    
}

@property(nonatomic)float speed;
@property(nonatomic)float angle;

@property(nonatomic)float isRotating;

@property(nonatomic)float _radius;

@property(nonatomic)CCSprite* sprite;

-(CGPoint) getPointOnCircleWithRadius:(float)radius
                                angle:(float)a
                               origin:(CGPoint)origin;

-(id)initCurve;

-(void)startMovement;
-(void)startMovement:(float)interval;

-(void)move;

@end
