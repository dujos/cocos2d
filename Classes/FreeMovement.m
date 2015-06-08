#import "FreeMovement.h"

@implementation FreeMovement

-(id)initFreeMovemet:(CGPoint)start
                 end:(CGPoint)end
            velocity:(CGPoint)velocity;
{
    self = [self init];
    
    self._endPoint = end;
    self._startPoint = start;
    self._velocity = velocity;
    
    return self;
}

-(void)startMovement:(float)interval
{
    [self schedule:@selector(move) interval:interval];
}

-(void)startMovement
{
    [self schedule:@selector(move) interval:.1f];
}

-(void)move
{
    CGPoint curretPosition = self.sprite.position;
    if (ccpDistance(curretPosition, self._endPoint) > 0.01f)
    {
        self._velocity = ccpSub(curretPosition, self._endPoint);
        self._velocity = ccpNormalize(self._velocity);
        self._velocity = ccpMult(self._velocity, -2.f);
        
        CGPoint xy = ccpAdd(curretPosition, self._velocity);
        self.sprite.position = xy;

    } else {
        if (CGPointEqualToPoint(curretPosition, self._endPoint))
        {
            CGPoint temp = self._endPoint;
            self._endPoint = self._startPoint;
            self._startPoint = temp;
        }
    }
}

@end
