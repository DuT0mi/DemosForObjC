#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;   // Its automatically, dont have to
@synthesize rank = _rank;   // Its automatically, dont have to

- (NSString * )contents{
    NSArray *rankString = [PlayingCard rankString];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}
// It's a class method: usually for getting items (and generate them)
+ (NSArray *)validSuits{
    return @[@"H",@"R",@"B",@"C"];
}
+ (NSUInteger)maxRank{
    return [[self rankString] count]-1;
}
+ (NSArray *)rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
- (void)setSuit: (NSString * )paramSuit{
    if([[PlayingCard validSuits] containsObject:paramSuit]){
        _suit =paramSuit;
    }
}
- (NSString *)suit{
    return _suit ? _suit    : @"?";
}
- (void) setRank:(NSUInteger)paramRank{
    if(paramRank <= [PlayingCard maxRank]){
        _rank = paramRank;
    }
}
@end
