#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface Line : CCNode

-(id)init;

-(void)draw:(CGPoint)from
         to:(CGPoint)to
     radius:(CGFloat)radius
      color:(CCColor*)color;

@end
