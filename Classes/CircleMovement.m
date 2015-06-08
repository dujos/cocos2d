#import "CircleMovement.h"

@implementation CircleMovement

-(id)initCurve
{
	self = [super init];
    
    self.isRotating = YES;
    
	return self;
}

-(CGPoint) getPointOnCircleWithRadius:(float)radius
                                angle:(float)a
                               origin:(CGPoint)origin
{
    float x = radius * cosf(CC_DEGREES_TO_RADIANS(a)) + origin.x;
	float y = radius * sinf(CC_DEGREES_TO_RADIANS(a)) + origin.y;
	return CGPointMake(x, y);
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
    if (self.isRotating)
    {
        float w = self.speed / self._radius;
        self.angle += CC_RADIANS_TO_DEGREES(w);
        
        CGPoint p2 = [self.sprite position];
        CGPoint p1 = [self getPointOnCircleWithRadius:self._radius
                                                angle:self.angle
                                               origin:p2];
        self.sprite.position = p1;
    }
}

@end