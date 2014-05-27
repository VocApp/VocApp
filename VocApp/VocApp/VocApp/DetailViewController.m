//
//  DetailViewController.m
//  VocApp
//
//  Created by Tim Härle on 24.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "DetailViewController.h"
#import "AllLections.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak,nonatomic) NSArray *array;
@property (weak, nonatomic) IBOutlet UILabel *original;
@property (weak, nonatomic) IBOutlet UITextField *translation;
@property  int actualWordIndex;
@property  int  maxWordIndex;
@property BOOL inCorrectMode;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)comeToEnd {

    if (_actualWordIndex==(_maxWordIndex)) {
        
        return NO;
    }
    return YES;
}



- (IBAction)swipeToCorrect:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipped");
    if ([self comeToEnd]){
    [_translation endEditing:YES];
    switch (_inCorrectMode){
            case YES:
            
                if([_translation.text isEqualToString: _array[_actualWordIndex][1] ]){
                    NSLog(@"Richtig");
                    self.VocappView.backgroundColor=[UIColor    colorWithRed:0.0f green:1.0 blue:0 alpha:0.25];
                    
                    _inCorrectMode=NO;
                    self.actualWordIndex++;
                    self.progress.progress=self.actualWordIndex/self.maxWordIndex;
                }else{
                    
                    self.VocappView.backgroundColor=[UIColor    colorWithRed:1.0f green:0.0 blue:0 alpha:0.25];
                        _inCorrectMode=NO;
                    
                        self.progress.progress=self.actualWordIndex/self.maxWordIndex;
                    self.correction.text=_array[_actualWordIndex][1];
                    self.actualWordIndex++;
                    self.progress.progress=self.actualWordIndex/self.maxWordIndex;
                }
            break;
            case NO:
            self.VocappView.backgroundColor=[UIColor   colorWithRed:0 green:0.6 blue:1 alpha:1];
                self.original.text=self.array[self.actualWordIndex][0];
                self.translation.text=@"";
                self.correction.text=@"";
                _inCorrectMode=YES;
            break;

    }
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label1.text=self.lection[@"name"];
    _array=_lection[@"entries"];
    NSLog(@"Wörter in Lektion:%d",_array.count);
    _original.text=_array[0][0];
    self.correction.text=@"";
    _maxWordIndex=_array.count;
    _actualWordIndex=0;
   _inCorrectMode=YES;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
