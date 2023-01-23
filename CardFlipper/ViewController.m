#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
// Weak is enough, cuz we have a strong to the whole view
@property (nonatomic) int flipCount;
@end

@implementation ViewController
- (IBAction)touchCardButton:(UIButton *)sender {
    // IBAction similar to typedef void
    // reason:
    // We can see whose action is it, but the compiler ignores it
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++; // It is calling getter and setter too. Getter for increment and setter, for setting it
    
}
- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",_flipCount];
    // For debug:
        // NSLog(@"flipCount",self.flipCount);
        // NSLog(@"flipCount",_flipCount);
}

@end
