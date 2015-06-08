#import "cocos2d-ui.h"
#import "cocos2d.h"

#import "Kong.h"

@class Kong;

@interface Movement : CCNode
{
    CGPoint touchPosition;
    CGPoint lastPosition;
}

@property(assign, nonatomic)Kong* kong;
@property(assign, nonatomic)CGPoint _velocity;


-(id)initMovement;

@end
