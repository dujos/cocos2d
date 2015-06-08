#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

@interface FreeMovement : CCNode
{
    
}

@property(nonatomic) CGPoint _startPoint;
@property(nonatomic) CGPoint _endPoint;

@property(nonatomic) CGPoint _velocity;
@property(nonatomic) CCSprite* sprite;

-(id)initFreeMovemet:(CGPoint)start
                 end:(CGPoint)end
            velocity:(CGPoint)velocity;

-(void)startMovement:(float)interval;

-(void)startMovement;

-(void)move;

@end
