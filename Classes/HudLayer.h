#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

#import "CCSprite.h"

@interface HudLayer : CCNode
{
    CGSize size;
    CGFloat offset;
    CGFloat digitOffset;
    
    CGPoint tokenPosition;
    CGPoint coinPosition;
    CGPoint wdonkeyPosition;
    CGPoint gdonkeyPosition;
    CGPoint selectPosition;
    
    CCSprite* coinSprite;
    CCSprite* coinDigitSprite;
    int coinIndex;
    
    CCSprite* tokenSprite;
    CCSprite* tokenDigitSprite;
    int tokenIndex;
    
    CCSprite* countdownSprite;
    int countdownIndex;
    
    CCAnimation* coinAnimation;
    CCAnimation* tokenAnimation;
    
    CCSprite* wdonkey;
    CCSprite* gdonkey;
    CCSprite* select;
    int selectionIndex;
    
    NSMutableArray* tokens;
    NSMutableArray* coins;
    NSMutableArray* countdown;
    
    CCSprite* tombstoneSprite;
    NSMutableArray* digitsFrames;
}

@property(nonatomic) int _index;
@property(nonatomic) BOOL _loop;

-(id)initHud:(int)index;

-(id)initHud;

-(void)loadSelections;

-(NSMutableArray* )loadNumbers:(int)start
                           end:(int)end
                     spritName:(NSString*)name
                      position:(CGPoint)point;

-(void)loadAnimations;

-(CCSprite* )loadSprite:(NSString* )spriteName
               position:(CGPoint)location;

-(CCAnimation* )loadAnimation:(NSInteger)frameSize
                   startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta
                       sprite:(NSString* )spriteName
                  spriteWidth:(GLfloat)width
                 spriteHeight:(GLfloat)height;

-(CCAnimation* )loadAnimation:(NSInteger)frameSize
                   startFrame:(NSInteger)startFrame
                        delta:(CGFloat)delta
                  animateName:(NSString* )animateName;

-(void)startCountdownAnimation;
-(void)startBlinkingAnimation;
-(void)startCountdown;

-(void)setSelectionIndex:(int)index;
-(void)hideSelectionBox:(int)index;

-(void)startAnimation:(CCSprite* )sprite;

-(void)loadToken;
-(void)loadCoin;
-(void)loadCountdown;

-(CGPoint)getCoinPos;
-(CGPoint)getTokenPos;

-(void)updateCoin;
-(void)updateToken;

@end