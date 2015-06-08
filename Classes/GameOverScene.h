#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface GameOverScene : CCScene
{

}

+(GameOverScene* )scene;
-(id)init;

-(void)showGameMessage:(BOOL)won;

@end
