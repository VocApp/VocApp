//
//  DetailViewController.m
//  VocApp
//
//  Created by Tim Härle on 24.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "Detail2ViewController.h"
#import "AllLections.h"
#import "LectionStatsViewController.h"
#import "ResultViewController.h"

@interface Detail2ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak,nonatomic) NSArray *array;
@property (strong,nonatomic) NSMutableArray *stats;
@property (weak, nonatomic) IBOutlet UILabel *original;
@property (weak, nonatomic) IBOutlet UITextField *translation;
@property  int actualWordIndex;
@property  int  maxWordIndex;
@property float actualWordIndexFloat,maxWordIndexFloat;
@property BOOL inCorrectMode;
@property (strong,nonatomic) PFObject* statsPF;
@property int rightWords;
@property (strong,nonatomic) NSMutableArray* wrongWords;


@end

@implementation Detail2ViewController

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
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Lektion beendet" message:@"Lektion abgeschlossen" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil ];
        [alert show];
        
        [self performSegueWithIdentifier:@"auswertung" sender:self];
        
        //        [self.navigationController popToRootViewControllerAnimated:YES];
        return NO;
    }
    return YES;
}

-(NSMutableArray*) wrongWords{
    if (_wrongWords==nil) {
        _wrongWords=[[NSMutableArray alloc]init];
    }
    return _wrongWords;
    
}

- (IBAction)swipeToCorrect:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipped");
    if ([self comeToEnd]){
        [_translation endEditing:YES];
        switch (_inCorrectMode){
            case YES:
                
                if([_translation.text isEqualToString: _array[_actualWordIndex][1] ]){
                    NSLog(@"Richtig");
                    self.rightWords++;
                    NSNumber *num1=self.stats[_actualWordIndex][0];
                    NSNumber *num=self.stats[_actualWordIndex][1];
                    NSInteger a=[num integerValue];
                    NSInteger b=[num1 integerValue];
                    self.stats[self.actualWordIndex]=@[[NSNumber numberWithInt:b+1],[NSNumber numberWithInt:a+1]];
                    self.VocappView.backgroundColor=[UIColor    colorWithRed:0.0f green:1.0 blue:0 alpha:0.25];
                    
                    _inCorrectMode=NO;
                    self.actualWordIndex++;
                    _actualWordIndexFloat++;
                    [self.progress setProgress:((self.actualWordIndexFloat)/self.maxWordIndexFloat) animated:YES];
                }else{
                    NSLog(@"Falsch");
                    NSNumber *num1=self.stats[_actualWordIndex][0];
                    NSNumber *num=self.stats[_actualWordIndex][1];
                    NSInteger a=[num integerValue];
                    NSInteger b=[num1 integerValue];
                    self.stats[self.actualWordIndex]=@[[NSNumber numberWithInt:b+1],[NSNumber numberWithInt:a]];
                    self.VocappView.backgroundColor=[UIColor    colorWithRed:1.0f green:0.0 blue:0 alpha:0.25];
                    _inCorrectMode=NO;
                    
                    self.progress.progress=self.actualWordIndex/self.maxWordIndex;
                    self.correction.text=_array[_actualWordIndex][1];
                    [self.wrongWords addObject:self.array[_actualWordIndex]];
                    self.actualWordIndex++;
                    _actualWordIndexFloat++;
                    float prog=((self.actualWordIndexFloat)/self.maxWordIndexFloat);
                    NSLog(@"progress: %f",prog);
                    [self.progress setProgress: prog animated:YES];
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
    PFQuery *q=[PFQuery queryWithClassName:@"Stats"];
    [q whereKey:@"User" equalTo:[PFUser currentUser]];
    [q whereKey:@"Lection" equalTo:_lection];
    [q findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"log: %lu",(unsigned long)objects.count);
        _stats=objects[0][@"Stats"];
        _statsPF=objects[0];
        NSLog(@"log:: %@",_stats);
        if (self.stats==nil) {
            self.stats=[[NSMutableArray alloc]initWithCapacity:_array.count] ;
            
            NSInteger i;
            for(i=0;i<self.array.count;i++){
                [self.stats addObject:@[@0,@0]];
            }
        }
    }];
    NSLog(@"Wörter in Lektion:%d",_array.count);
    _original.text=_array[0][0];
    self.correction.text=@"";
    _maxWordIndex=_array.count;
    _maxWordIndexFloat=_array.count;
    _actualWordIndex=0;
    _actualWordIndexFloat=0.0;
    _rightWords=0;
    _inCorrectMode=YES;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"Disappear");
    self.statsPF[@"Stats"]=self.stats ;
    [self.statsPF saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"auswertung"]){
        
        ((ResultViewController*)[segue destinationViewController]).rightWords=self.rightWords;
        ((ResultViewController*)[segue destinationViewController]).words=self.maxWordIndex;
        ((ResultViewController*)[segue destinationViewController]).falsch=self.wrongWords;
    }
    if([segue.identifier isEqualToString:@"stats"]){
        ((LectionStatsViewController*)[segue destinationViewController]).stats=self.statsPF;
        ((LectionStatsViewController*)[segue destinationViewController]).lection=self.lection;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
