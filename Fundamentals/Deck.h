#ifndef Deck_h
#define Deck_h
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck :   NSObject

- (void) addCard: (Card *)card atTop:(BOOL) atTop;
- (void) addCard: (Card *)card;
- (Card *) drawRandomCard;


@end

#endif /* Deck_h */
