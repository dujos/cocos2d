#import <Foundation/Foundation.h>

#import "Entity.h"

@interface KongTile : Entity
{
    NSMutableArray* unSelectedTiles;
    NSMutableArray* selectedTiles;
    
    CCSprite* barrelSprite;
    
    CCSprite* kSprite;
    CCSprite* oSprite;
    CCSprite* nSprite;
    CCSprite* gSprite;
    CCSprite* xSprite;
    
    int currentIndex;
    int currentSelectedIndex;
    BOOL collisionDetected;
}

-(id)initKongTile:(CCPhysicsNode* )world;

-(void)moveTile:(CCSprite* )sprite;

-(void)checkCollision;

-(void)start;

-(void)startAnimation;

-(void)setPos:(CGPoint)position;

@end
