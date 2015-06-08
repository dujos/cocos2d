#import <Foundation/Foundation.h>

#import "Enemy.h"
#import "GameScene.h"

@interface Krog : Enemy
{
    CGFloat move;
    CGFloat moveStop;
    
    CGFloat radius;
    CGPoint startPosition;
    CGPoint currentPosition;
    
    BOOL stopped;
}

-(id)initKrog:(CCPhysicsNode* )world;

-(id)createKrog:(int)index;
-(id)create;

-(void)checkCollision:(CCSprite* )sprite;

-(CGPoint)nextMove;

-(void)selectMovement:(int)emove;

-(void)moveKrog1;
-(void)moveKrog2;
-(void)moveKrog3;
-(void)moveKrog4;
-(void)moveKrog5;

@end