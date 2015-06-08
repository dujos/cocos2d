#import <Foundation/Foundation.h>

#import "cocos2d-ui.h"
#import "cocos2d.h"

#import "Balloon.h"
#import "Banana.h"
#import "Coin.h"

@interface PickableCache : CCNode
{
    NSString* name;
}

-(id)init;

@property(nonatomic) NSMutableArray* _pickables;
@property(nonatomic) NSMutableArray* _numbers;
@property(nonatomic) NSMutableArray* _bananas;
@property(nonatomic) NSMutableArray* _coins;
@property(nonatomic) NSMutableArray* _ballloons;

-(NSMutableArray*) pickables;
-(NSMutableArray*) numbers;
-(NSMutableArray*) bananas;
-(NSMutableArray*) coins;
-(NSMutableArray*) ballloons;

-(void)getName;

-(void)createPickables:(CGPoint)position
                    at:(NSInteger)index
              velocity:(CGPoint)velocity
                 world:(CCPhysicsNode* )physicsWorld;

-(void)loadPickablesSquare:(CGPoint)point
                   index:(int)index
                velocity:(CGPoint)velocity
                   world:(CCPhysicsNode* )physicsWorld;

-(void)loadPickablesVLine:(CGPoint)point
                  index:(int)index
               velocity:(CGPoint)velocity
                  world:(CCPhysicsNode* )physicsWorld;

-(void)loadPickablesHLine:(CGPoint)point
                  index:(int)index
               velocity:(CGPoint)velocity
                  world:(CCPhysicsNode* )physicsWorld;

-(void)loadPickablesX:(CGPoint)point
              index:(int)index
           velocity:(CGPoint)velocity
              world:(CCPhysicsNode* )physicsWorld;

-(void)loadPickablesCircle:(CGPoint)point
                  radius:(float)radius
                   index:(int)index
                velocity:(CGPoint)velocity
                   world:(CCPhysicsNode* )physicsWorld;

-(void)cleanPickables;

@end