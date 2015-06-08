#import "AppDelegate.h"
#import "MenuScene.h"

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self setupCocos2dWithOptions:@{
		CCSetupShowDebugStats: @(NO),
	}];
	
	return YES;
}

-(CCScene *)startScene
{
	return [MenuScene scene];
}

@end