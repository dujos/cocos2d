#import "Line.h"

@implementation Line

-(id)init
{
    self = [super init];
    return self;
}

-(void)draw:(CGPoint)from
         to:(CGPoint)to
     radius:(CGFloat)radius
      color:(CCColor*)color;
{
    [super draw];
    
    CCDrawNode* drawNode = [[CCDrawNode alloc] init];
    
    [drawNode drawSegmentFrom:from
                           to:to
                       radius:radius
                        color:color];
}

@end
