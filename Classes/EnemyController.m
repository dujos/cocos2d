#import "EnemyController.h"
#import "EnemyCache.h"
#import "GameScene.h"
#import "PickableCache.h"

@implementation EnemyController

-(void)createSelector:(id)sender
{

}

-(void)create:(EnemyDetail)enemyDetail
{
    createCount = 0;
    detail = enemyDetail;
    size = [[CCDirector sharedDirector] viewSize];
}

@end
