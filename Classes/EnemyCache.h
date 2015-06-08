#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

#import "Enemy.h"

@class Enemy;

@interface EnemyCache : CCNode
{

}

@property(nonatomic)CCPhysicsNode* _physicsWorld;

-(id)init;

-(void)createEnemy:(Enemy* )enemy at:(CGPoint)position;

-(void)createEnemy:(Enemy* )enemy
          movement:(int)movement
                at:(CGPoint)position;

-(void)setCurrentLevel:(BOOL)end;

@end
