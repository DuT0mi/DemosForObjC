#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headLine;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController
- (IBAction)changeBodySelectionColorToMatchBackgroundButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor
        range:self.body.selectedRange
     ];
    
}
- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-4,
            NSStrokeColorAttributeName:[UIColor blackColor]} range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Additional setup atfer loading the view
    NSMutableAttributedString * title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.titleLabel.text];
    // The buttons have their own color -> Tint Color at setting
    // range the entire text (from zero to the title's length)
    [title setAttributes:@{NSStrokeWidthAttributeName: @-3,
                           NSStrokeColorAttributeName:self.outlineButton.tintColor}range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    
}
- (void)viewWillAppear:(BOOL)animated{
    // Just before the view appears on screen you get notified
    // What if my view appears i start listening, it disappears and they change the text style? And i reapper? I wont be notified --> sol: usePreferredFonts
    [self usePreferredFonts];
    // We can call super before and after our work, before is more safe
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}
- (void)preferredFontsChanged: (NSNotification *)notification{
    [self usePreferredFonts];
}
- (void) usePreferredFonts{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headLine.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}
- (void) viewWillDisappear:(BOOL)animated{
    // For stops listening
    [super viewWillDisappear:animated];
    // Remove for that radio station (now there only one, but could be more and some of them should not be removed)
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}
@end
