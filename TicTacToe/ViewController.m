//
//  ViewController.m
//  TicTacToe
//
//  Created by Thomas M. Mroz on 5/15/14.
//  Copyright (c) 2014 BGHS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *myLabelThree;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFour;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFive;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (weak, nonatomic) IBOutlet UILabel *myLabelEight;
@property (weak, nonatomic) IBOutlet UILabel *myLabelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (weak, nonatomic) IBOutlet UILabel *xMovelabel;
@property (weak, nonatomic) IBOutlet UILabel *oMoveLabel;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.whichPlayerLabel.text = @"X";
}

- (UILabel *)findLabelUsingPoint:(CGPoint)point
{
    if (CGRectContainsPoint(self.myLabelOne.frame, point))
    {return self.myLabelOne;}
    else if (CGRectContainsPoint(self.myLabelTwo.frame, point))
    {return self.myLabelTwo;}
    else if (CGRectContainsPoint(self.myLabelThree.frame, point))
    {return self.myLabelThree;}
    else if (CGRectContainsPoint(self.myLabelFour.frame, point))
    {return self.myLabelFour;}
    else if (CGRectContainsPoint(self.myLabelFive.frame, point))
    {return self.myLabelFive;}
    else if (CGRectContainsPoint(self.myLabelSix.frame, point))
    {return self.myLabelSix;}
    else if (CGRectContainsPoint(self.myLabelSeven.frame, point))
    {return self.myLabelSeven;}
    else if (CGRectContainsPoint(self.myLabelEight.frame, point))
    {return self.myLabelEight;}
    else if (CGRectContainsPoint(self.myLabelNine.frame, point))
    {return self.myLabelNine;}
    else
        return 0;

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer*)tapGestureRecognizer
{

    CGPoint point;
    point = [tapGestureRecognizer locationInView:self.view];

    UILabel *tapped =[self findLabelUsingPoint:point];


    if([tapped.text isEqual: @""])
    {
        if([self.whichPlayerLabel.text isEqual: @"X"])
        {
            tapped.textColor = [UIColor blueColor];
            tapped.text = @"X";
            self.whichPlayerLabel.text = @"O";

        }
        else
        {
            tapped.textColor = [UIColor redColor];
            tapped.text = @"O";
            self.whichPlayerLabel.text = @"X";

        }
    }
    [self endGame];

}
-(void) endGame
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert addButtonWithTitle:@"Play Again"];
    //[alert addButtonWithTitle:@"QUit"];
    //alert.delegate = self;

    if([[self whoWon] isEqualToString:(@"X")])
    {
        alert.title = @"WINNER";
        alert.message =@"Player X Wins";
        [alert show];
        [self clearBoard];
    }
    else if([[self whoWon] isEqualToString:(@"O")])
    {
        alert.title = @"WINNER";
        alert.message =@"Player O Wins";
        [alert show];
        [self clearBoard];
    }
   else if ((![self.myLabelOne.text isEqualToString:@""] && ![self.myLabelTwo.text isEqualToString:@""]
               && ![self.myLabelThree.text isEqualToString:@""] && ![self.myLabelFour.text isEqualToString:@""]
               && ![self.myLabelFive.text isEqualToString:@""] && ![self.myLabelSix.text isEqualToString:@""]
               && ![self.myLabelNine.text isEqualToString:@""]))
    {
        alert.title = @"NO WINNER";
        alert.message =@"It's a Tie";
        [alert show];
        [self clearBoard];
    }
}

-(void) clearBoard
{
    self.myLabelOne.text = @"";
    self.myLabelTwo.text = @"";
    self.myLabelThree.text= @"";
    self.myLabelFour.text =@"";
    self.myLabelFive.text = @"";
    self.myLabelSix.text =@"";
    self.myLabelSeven.text =@"";
    self.myLabelEight.text =@"";
    self.myLabelNine.text =@"";
    self.whichPlayerLabel.text = @"X";
}


-(NSString *) whoWon
{
    NSString *winner;
    if([self.myLabelOne.text isEqualToString:(@"X")] && [self.myLabelTwo.text isEqualToString:(@"X")] && [self.myLabelThree.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelFour.text isEqualToString:(@"X")] && [self.myLabelFive.text isEqualToString:(@"X")] && [self.myLabelSix.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelSeven.text isEqualToString:(@"X")] && [self.myLabelEight.text isEqualToString:(@"X")] && [self.myLabelNine.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelOne.text isEqualToString:(@"X")] && [self.myLabelFour.text isEqualToString:(@"X")] && [self.myLabelSeven.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelTwo.text isEqualToString:(@"X")] && [self.myLabelFive.text isEqualToString:(@"X")] && [self.myLabelEight.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelThree.text isEqualToString:(@"X")] && [self.myLabelSix.text isEqualToString:(@"X")] && [self.myLabelNine.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelOne.text isEqualToString:(@"X")] && [self.myLabelFive.text isEqualToString:(@"X")] && [self.myLabelNine.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelThree.text isEqualToString:(@"X")] && [self.myLabelFive.text isEqualToString:(@"X")] && [self.myLabelSeven.text isEqualToString:(@"X")])
    { winner = @"X";}
    else if([self.myLabelOne.text isEqualToString:(@"O")] && [self.myLabelTwo.text isEqualToString:(@"O")] && [self.myLabelThree.text isEqualToString:(@"O")])
    { winner = @"O";}
    else if([self.myLabelFour.text isEqualToString:(@"O")] && [self.myLabelFive.text isEqualToString:(@"O")] && [self.myLabelSix.text isEqualToString:(@"O")])
    { winner = @"O";}
    else if([self.myLabelSeven.text isEqualToString:(@"O")] && [self.myLabelEight.text isEqualToString:(@"O")] && [self.myLabelNine.text isEqualToString:(@"O")])
    { winner = @"Player O WINS!";}
    else if([self.myLabelOne.text isEqualToString:(@"O")] && [self.myLabelFour.text isEqualToString:(@"O")] && [self.myLabelSeven.text isEqualToString:(@"O")])
    { winner = @"O";}
    else if([self.myLabelTwo.text isEqualToString:(@"O")] && [self.myLabelFive.text isEqualToString:(@"O")] && [self.myLabelEight.text isEqualToString:(@"O")])
    { winner = @"O";}
    else if([self.myLabelThree.text isEqualToString:(@"O")] && [self.myLabelSix.text isEqualToString:(@"O")] && [self.myLabelNine.text isEqualToString:(@"O")])
    { winner = @"O";}
    else if([self.myLabelOne.text isEqualToString:(@"O")] && [self.myLabelFive.text isEqualToString:(@"O")] && [self.myLabelNine.text isEqualToString:(@"O")])
    { winner = @"O";}
    else if([self.myLabelThree.text isEqualToString:(@"O")] && [self.myLabelFive.text isEqualToString:(@"O")] && [self.myLabelSeven.text isEqualToString:(@"O")])
    { winner = @"O";}

    return winner;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
