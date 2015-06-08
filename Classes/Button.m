#import "Button.h"

@implementation Button

-(id)initButton:(NSString*)spriteButton spritePosition:(CGPoint)position
{
    button = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:spriteButton]];
    [button setPosition:position];
    return self;
}

-(CCButton* )button
{
    return button;
}

@end
