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
    self.LectionName.text=self.lection[@"name"];
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
    self.tryCount.text=[NSString stringWithFormat:@"%.01f",avgT ] ;
    self.right.text=[NSString stringWithFormat:@"%.01f",avgR ] ;

    
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
