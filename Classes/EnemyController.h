#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "cocos2d-ui.h"

typedef struct EnemyDetail{
    NSInteger moveType;
    CGFloat   positionX;
    CGFloat   positionY;
    NSInteger createType;
    NSInteger createCount;
    NSInteger pickable;
} EnemyDetail;

@interface EnemyController : CCNode
{
    EnemyDetail detail;
    NSInteger createCount;
    CGSize size;
}

-(void)createSelector:(id) sender;

-(void)create:(EnemyDetail) detail;

@end

/*
@interface SymetricalEnemyController : EnemyController {}

@end

@interface GroupEnemyController : SymetricalEnemyController
{
    NSMutableArray* enemies;
}

@end

@interface SteadyEnemyController : SymetricalEnemyController {}

@end
*/
