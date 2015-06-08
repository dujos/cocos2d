#import "KongTile.h"
#import "Kong.h"

@implementation KongTile

-(id)initKongTile:(CCPhysicsNode* )world;
{
    self = [super initEntity:world];
    
    currentIndex = 0;
    currentSelectedIndex = 10;
    collisionDetected = false;
    
    unSelectedTiles = [[NSMutableArray alloc] init];
    selectedTiles = [[NSMutableArray alloc] init];
    
    [unSelectedTiles addObject:[CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"k.png"]]];
    [unSelectedTiles addObject:[CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"o.png"]]];
    [unSelectedTiles addObject:[CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"n.png"]]];
    [unSelectedTiles addObject:[CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"g.png"]]];
    [unSelectedTiles addObject:[CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"x.png"]]];
    
    barrelSprite = [CCSprite spriteWithImageNamed:[NSString stringWithFormat:@"barrel.png"]];
    
    [self addChild:barrelSprite z:-10 name:@"barrel sprite"];
    [self startAnimation];

    
    for (int i = 0; i < unSelectedTiles.count; i++)
    {
        if (currentIndex == i) {
            [unSelectedTiles[i] setVisible:YES];
        } else {
            [unSelectedTiles[i] setVisible:NO];
        }
        //[unSelectedTiles[i] ];
        [self addChild:unSelectedTiles[i]];
    }
    return self;
}

-(void)checkCollision
{
    Kong* kong = [[GameScene scene] getKong];
    
    if (CGRectIntersectsRect([barrelSprite boundingBox],
                             [kong.getKongSprite boundingBox]))
    {
        if (collisionDetected == false)
        {
            collisionDetected = true;
            //[selectedTiles addObject:unSelectedTiles[currentIndex]];
            //[unSelectedTiles removeObjectAtIndex:currentIndex];
            //[self moveTile:selectedTiles[currentIndex]];
        }
    }
    collisionDetected = false;
}

-(void)moveTile:(CCSprite* )sprite
{
    CGPoint point = ccp(400.f, 400.f);
    CCActionMoveTo* actionMove = [CCActionMoveTo actionWithDuration:0.1f position:point];
    [sprite runAction:actionMove];
}

-(void)start
{
    int len = unSelectedTiles.count - 1;
    
    if (currentIndex != len) {
        [unSelectedTiles[currentIndex] setVisible:NO];
        currentIndex += 1;
        [unSelectedTiles[currentIndex] setVisible:YES];
    } else {
        [unSelectedTiles[currentIndex] setVisible:NO];
        currentIndex = 0;
        [unSelectedTiles[currentIndex] setVisible:YES];
    }
    
    [self setPos:barrelSprite.position];
}

-(void)setPos:(CGPoint)position
{
    [barrelSprite setPosition:position];
    CCSprite* tile = unSelectedTiles[currentIndex];
    
    [tile setPosition:position];
}

-(void)startAnimation
{
    [self schedule:@selector(start) interval:3.f];
}

-(void)update:(CCTime)delta
{
    [self checkCollision];
}

@end