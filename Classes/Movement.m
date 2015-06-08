#import "Movement.h"

@implementation Movement

-(id)initMovement
{
    if (self = [super init]) {
        self._velocity = ccp(0, 0);
    }
    return self;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (self.kong._canMoveFree) {
        self._velocity = ccpSub(self.kong.getKongSprite.position,
                                touch.locationInWorld);
        self._velocity = ccpNormalize(self._velocity);
        self.kong._velocity = ccpMult(self._velocity, -1);
        
        if (self.kong.currentState != move)
        {
            [self.kong startAnimation:move];
        }
    }
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

@end