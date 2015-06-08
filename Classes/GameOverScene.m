#import "GameOverScene.h"

@implementation GameOverScene


static GameOverScene* _gameOverScene = nil;


+(GameOverScene *)scene
{
    if (!_gameOverScene) {
        _gameOverScene = [[self alloc] init];
        return _gameOverScene;
    }
    return _gameOverScene;
}

-(id)init
{
    self = [super init];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void)showGameMessage:(BOOL)won
{
    NSString * message;
    if (won) {
        message = @"You Won!";
    } else {
        message = @"You Lose!";
    }
    
    CGSize size = [[CCDirector sharedDirector] viewSize];
    CCLabelTTF* label = [CCLabelTTF labelWithString:message
                                           fontName:@"Arial" fontSize:32];
    
    label.position = ccp(size.width/2, size.height/2);
    [self addChild:label];
    
}

@end
