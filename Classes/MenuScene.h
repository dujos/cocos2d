#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

#import "GameScene.h"
#import "MapScene.h"

@interface MenuScene : CCScene
{
    CCButton* pauseGame;
    CCButton* resumeGame;
    CCButton* newGame;
    
    CCButton* diddy;
    CCButton* kong;
}

+(MenuScene* )scene;
-(id)init;

-(void)clickNewGame:(id)sender;
-(void)clickResumeGame:(id)sender;
-(void)clickPauseGame:(id)sender;

-(void)selectDonkey:(id)sender;
-(void)selectDiddy:(id)sender;

-(CCButton*)loadButton:(CCButton*)button
                 title:(NSString* )buttonTitle
                 image:(NSString* )imageTitle
              position:(CGPoint)buttonPos
                 scale:(float)buttonScale;


@end
