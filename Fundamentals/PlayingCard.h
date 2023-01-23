#ifndef PlayingCard_h
#define PlayingCard_h
#import "Card.h"

@interface PlayingCard  :   Card

@property (strong,nonatomic) NSString * suit;
@property (nonatomic) NSUInteger    rank;
// public
+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end

#endif /* PlayingCard_h */
