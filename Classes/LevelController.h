#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

#import "GameScene.h"
#import "EnemyController.h"

@interface LevelController : CCNode
{
    EnemyDetail currentDetail;
    CGSize size;
}

-(id)init;

-(void)loadCurrentLevel:(NSInteger)level;

-(void)createEnemySelector:(CCTime)delta;

@end
