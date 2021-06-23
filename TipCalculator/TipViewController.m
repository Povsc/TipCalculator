//
//  TipViewController.m
//  TipCalculator
//
//  Created by felipeccm on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UITextField *tipTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *totalTextLabel;


@end

@implementation TipViewController

BOOL lowered = true;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.billField becomeFirstResponder];
}
- (IBAction)updateLabel:(id)sender {
    if (self.billField.text.length == 0 && lowered == false){
        [self hideLabels];
        lowered = true;
    }
    
    if (self.billField.text.length == 1 && lowered == true){
        [self showLabels];
        lowered = false;
    }
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y += 200;
        self.billField.frame = billFrame;
        
        CGRect tipFrame = self.tipLabel.frame;
        tipFrame.origin.y += 200;
        self.tipLabel.frame = tipFrame;
        self.tipLabel.hidden = true;
        
        CGRect tipTextFrame = self.tipTextLabel.frame;
        tipTextFrame.origin.y += 200;
        self.tipTextLabel.frame = tipTextFrame;
        self.tipTextLabel.hidden = true;
        
        CGRect totalFrame = self.totalLabel.frame;
        totalFrame.origin.y += 200;
        self.totalLabel.frame = totalFrame;
        self.totalLabel.hidden = true;
        
        CGRect totalTextFrame = self.totalTextLabel.frame;
        totalTextFrame.origin.y += 200;
        self.totalTextLabel.frame = totalTextFrame;
        self.totalTextLabel.hidden = true;
        
        CGRect percentageFrame = self.tipPercentageControl.frame;
        percentageFrame.origin.y += 200;
        self.tipPercentageControl.frame = percentageFrame;
        self.tipPercentageControl.hidden = true;
    }];
    
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y -= 200;
        self.billField.frame = billFrame;
        
        CGRect tipFrame = self.tipLabel.frame;
        tipFrame.origin.y -= 200;
        self.tipLabel.frame = tipFrame;
        self.tipLabel.hidden = false;
        
        CGRect tipTextFrame = self.tipTextLabel.frame;
        tipTextFrame.origin.y += 200;
        self.tipTextLabel.frame = tipTextFrame;
        self.tipTextLabel.hidden = true;
        
        CGRect totalFrame = self.totalLabel.frame;
        totalFrame.origin.y -= 200;
        self.totalLabel.frame = totalFrame;
        self.totalLabel.hidden = false;
        
        CGRect totalTextFrame = self.totalTextLabel.frame;
        totalTextFrame.origin.y -= 200;
        self.totalTextLabel.frame = totalTextFrame;
        self.totalTextLabel.hidden = false;
        
        CGRect percentageFrame = self.tipPercentageControl.frame;
        percentageFrame.origin.y -= 200;
        self.tipPercentageControl.frame = percentageFrame;
        self.tipPercentageControl.hidden = false;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
