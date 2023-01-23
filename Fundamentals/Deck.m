#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray * cards;
@end

@implementation Deck

// getter for the cards
- (NSMutableArray *)cards{
    // If null
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return  _cards;
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card{
    
}
- (Card *)drawRandomCard{
    
    Card * randomCard = nil;
    
    // If the Deck is empty
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        // deleting from the Deck because of we draw it out from the Deck
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
