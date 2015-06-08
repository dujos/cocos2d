#import "LevelController.h"
#import "Krog.h"

@implementation LevelController

-(id)init
{
    self = [super init];
    if (!self)
        return(nil);
    
    size = [[CCDirector alloc] viewSize];
    return self;
}

-(void)loadCurrentLevel:(NSInteger)level
{
    NSString* levelName;
    if (level == 1) {
        levelName = @"purple";
    } else if (level == 2) {
        levelName = @"brown";
    } else if (level == 3) {
        levelName = @"orange";
    }
}

-(void)createEnemySelector:(CCTime)delta
{
    
}


@end