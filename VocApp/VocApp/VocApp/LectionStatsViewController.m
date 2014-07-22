//
//  LectionStatsViewController.m
//  VocApp
//
//  Created by Tim on 21.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "LectionStatsViewController.h"

@interface LectionStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *LectionName;
@property (weak, nonatomic) IBOutlet UILabel *tryCount;
@property (weak, nonatomic) IBOutlet UILabel *right;
@property (weak, nonatomic) IBOutlet UILabel *bewertung;
@property (weak, nonatomic) IBOutlet UITextView *verlauf;

@end

@implementation LectionStatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *stat=self.stats[@"Stats"];
    NSArray *lec=self.lection[@"entries"];
    self.LectionName.text=self.lection[@"name"];
    NSMutableAttributedString* text=[[NSMutableAttributedString alloc]init];
    
    for (int i=0; i<lec.count; i++) {
        NSAttributedString* entry=[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ - %@      ",lec[i][0],lec[i][1]]];
        [text appendAttributedString:entry];
        NSAttributedString* puffer=[[NSAttributedString alloc]initWithString:
                                            [NSString stringWithFormat:@"    " ]];
        [text appendAttributedString:puffer];
        NSMutableAttributedString* verlauf=[[NSMutableAttributedString alloc]initWithString:
                                            [NSString stringWithFormat:@"█ █ █   \r \r" ]];
        
        for (int j=0; j<6; j=j+2) {
            if([stat[i][2+(j/2)] isEqual:@1]) {
               [verlauf addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(j,j+1)];
                
            }
            if([stat[i][2+(j/2)] isEqual:@0]) {
                
                [verlauf addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(j,j+1)];
            }
            if([stat[i][2+(j/2)] isEqual:@99]) {
                
                [verlauf addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(j,j+1)];
            }
          
    }
        [text appendAttributedString:[verlauf attributedSubstringFromRange:NSMakeRange(0,9)] ];
        [text addAttribute:NSFontAttributeName
                     value:[UIFont systemFontOfSize:20.0]
                     range:NSMakeRange(0, text.length-1)];
     
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 30;
        NSDictionary *dict = @{NSParagraphStyleAttributeName : paragraphStyle };
        [text addAttributes:dict range:NSMakeRange(0, text.length-1)];
        
        
        self.verlauf.attributedText=[text attributedSubstringFromRange:NSMakeRange(0, text.length-1)];
        
    }
    
    NSLog(@" stat: %@",stat);
    float avgR=0,avgT=0;
    int i;
    for ( i=0; i<stat.count; i++) {
        NSNumber* tmp1=stat[i][1];
        NSNumber* tmp2=stat[i][0];
        avgR=avgR+[tmp1 floatValue];
        avgT=avgT+[tmp2 floatValue];
    }
    avgR=avgR/stat.count;
    avgT=avgT/stat.count;
    self.tryCount.text=[NSString stringWithFormat:@"Anzahl Versuche: %.01f /Wort",avgT ] ;
    self.right.text=[NSString stringWithFormat:@"davon richtig: %.01f",avgR ] ;
    
    float rightWords=0.0;
    for ( i=0; i<stat.count; i++) {
        
        NSNumber* tmp1=stat[i][1];
        if ([tmp1 intValue]>=2) {
            rightWords++;
        }
    }
    
    rightWords = rightWords/stat.count;
    rightWords=rightWords*100;
    NSLog(@"richtigeWorte: %f",rightWords);
    self.bewertung.text=[NSString stringWithFormat:@"Bewertung: %0.0f %%",rightWords ];
    
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
