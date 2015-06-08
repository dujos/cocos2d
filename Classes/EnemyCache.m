#import "EnemyCache.h"

@implementation EnemyCache

-(id)init
{
    self = [super init];
    return self;
}

-(void)createEnemy:(Enemy* )enemy at:(CGPoint)position
{
    [self addChild:enemy];
}

-(void)createEnemy:(Enemy* )enemy
          movement:(int)movement
                at:(CGPoint)position
{
    [self addChild:enemy];
}

-(void)setCurrentLevel:(BOOL)end
{
    
}

@end
