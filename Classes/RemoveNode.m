#import "RemoveNode.h"

@implementation RemoveNode

-(void) startWithTarget:(id)aTarget
{
    [super startWithTarget:aTarget];
    [((CCNode *) _target) removeFromParentAndCleanup:YES];
}

@end