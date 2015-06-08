#import "PickableCache.h"

@implementation PickableCache

-(id)init
{
    self = [super init];
    
    name = @"pickable cache";
    
    self._pickables = [[NSMutableArray alloc] init];
    self._numbers = [[NSMutableArray alloc] init];
    
    self._bananas = [[NSMutableArray alloc] init];
    self._ballloons = [[NSMutableArray alloc] init];
    self._coins = [[NSMutableArray alloc] init];
    
    return self;
}

-(void)getName
{
    NSLog(@"    %@  ", name);
}

-(NSMutableArray*) pickables
{
    return self._pickables;
}

-(NSMutableArray*) numbers
{
    return self._numbers;
}

-(NSMutableArray*) bananas
{
    return self._bananas;
}

-(NSMutableArray*) coins
{
    return self._coins;
}

-(NSMutableArray*) ballloons
{
    return self._ballloons;
}

-(void)createPickables:(CGPoint)position
                    at:(NSInteger)index
              velocity:(CGPoint)velocity
                 world:(CCPhysicsNode* )physicsWorld;
{
    if (index == 1) {
        Coin* coin = [[Coin alloc] initCoin:physicsWorld
                                   velocity:velocity];
        [coin setPos:position];
        
        [self addChild:coin];
        [self._coins addObject:(Coin* )coin];
    } else if (index == 0) {
        Balloon* balloon = [[Balloon alloc] initBalloon:physicsWorld
                                               velocity:velocity];
        
        [balloon setPos:position];
        
        [self addChild:balloon];
        [self._ballloons addObject:(Balloon* )balloon];
    } else if (index == 2) {
        Banana* banana = [[Banana alloc] initBanana:physicsWorld
                                           velocity:velocity];
        
        [banana setPos:position];
        [banana setScale:0.5f];
        
        [self addChild:banana];
        [self._bananas addObject:(Banana* )banana];
    }
}

-(void)loadPickablesSquare:(CGPoint)point
                   index:(int)index
                velocity:(CGPoint)velocity
                   world:(CCPhysicsNode* )physicsWorld
{
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            point.x += i * 25;
            point.y += j * 25;
            [self createPickables:point
                                at:index
                         velocity:velocity
                            world:physicsWorld];
        }
    }
}

-(void)loadPickablesVLine:(CGPoint)point
                  index:(int)index
               velocity:(CGPoint)velocity
                  world:(CCPhysicsNode* )physicsWorld
{
    for (int j = 0; j < 5; j++)
    {
        point.y += j * 10;
        [self createPickables:point
                           at:index
                     velocity:velocity
                        world:physicsWorld];
    }
}

-(void)loadPickablesHLine:(CGPoint)point
                  index:(int)index
               velocity:(CGPoint)velocity
                  world:(CCPhysicsNode* )physicsWorld
{
    for (int i = 0; i < 5; i++)
    {
        point.x += i * 25;
        [self createPickables:point
                           at:index
                     velocity:velocity
                        world:physicsWorld];
    }
}

-(void)loadPickablesX:(CGPoint)point
              index:(int)index
           velocity:(CGPoint)velocity
              world:(CCPhysicsNode* )physicsWorld
{
    [self loadPickablesVLine:point
                     index:index
                  velocity:velocity
                     world:physicsWorld];
    
    [self loadPickablesHLine:point
                     index:index
                  velocity:velocity
                     world:physicsWorld];
}

-(void)loadPickablesCircle:(CGPoint)point
                  radius:(float)radius
                   index:(int)index
                velocity:(CGPoint)velocity
                   world:(CCPhysicsNode* )physicsWorld
{
    for (int angle = 0; angle <= 360; angle += 45)
    {
        float x = radius * cosf(CC_DEGREES_TO_RADIANS(angle)) + point.x;
        float y = radius * sinf(CC_DEGREES_TO_RADIANS(angle)) + point.y;
        
        [self createPickables:CGPointMake(x, y)
                           at:index
                     velocity:velocity
                        world:physicsWorld];
    }
}

-(void)cleanPickables
{
    [self removeAllChildrenWithCleanup:YES];
}

@end
