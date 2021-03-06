#import "SubAdlibAdViewCore.h"

@protocol AdlibManagerDelegate <NSObject>

//광고 수신 성공시 호출되는 메소드.
- (void)gotAd;

@end

@class AdlibContainer;
@interface AdlibManager : NSObject

+ (AdlibManager *)sharedSingletonClass;

-(void)initAdlib:(NSString*)key;
-(void)setConfigWithAge:(NSString*)age withGender:(NSString*)gender;
-(void)setConfigWithLat:(NSString*)lat withLon:(NSString*)lon;

-(NSString*)getCurrentVersion;

-(void)attach:(UIViewController*)parent withView:(UIView*)view withReceiver:(SEL)sel withPageName:(NSString*)name;
-(void)attach:(UIViewController*)parent withView:(UIView*)view withReceiver:(SEL)sel;

-(void)attach:(UIViewController*)parent withView:(UIView*)view withDelegate:(id<AdlibManagerDelegate>)del  withPageName:(NSString*)name;
-(void)attach:(UIViewController*)parent withView:(UIView*)view withDelegate:(id<AdlibManagerDelegate>)del;


-(void)detach:(UIViewController*)parent;
-(void)moveAdContainer:(CGPoint)pt;
-(CGSize)size;

-(void)setAutoresizingMask:(UIViewAutoresizing)mask;

-(NSString*)getGenderCauly;
-(NSString*)getAgeCauly;

-(NSString*)getGender;
-(NSString*)getAge;
-(NSString*)getLat;
-(NSString*)getLon;

-(void)setPlatform:(NSString*)name withClass:(Class)className;
-(void)setLogging:(BOOL)logging;

@end