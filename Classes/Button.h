#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface Button : NSObject
{
    CCButton* button;
}

-(id)initButton:(NSString*)spriteButton spritePosition:(CGPoint)position;
-(CCButton* )button;

@end
