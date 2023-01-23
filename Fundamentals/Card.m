#import "Card.h"

@interface Card()
@end

@implementation Card

@synthesize chosen =  _chosen;
@synthesize matched = _matched;

- (int)match:(NSArray *) otherCards{
    int score = 0;
    for(Card *card in otherCards)
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    
    return score;
}
@end
