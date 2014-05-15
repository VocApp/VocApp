//
//  EditViewController.m
//  VocApp
//
//  Created by Tim Härle on 15.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "EditViewController.h"
#import "Lection.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)submitLection:(id)sender {
    Lection * newLection=[Lection new];
    NSInteger sections=[self.tableView numberOfSections];
    for (int i=0; i<sections; i++) {
        NSIndexPath *act=[NSIndexPath indexPathForRow:0 inSection:i];
        UITextField * txt=  [self.tableView  cellForRowAtIndexPath:act].contentView.subviews[0];
        NSString* org= txt.text;
        
                    act=[NSIndexPath indexPathForRow:1 inSection:i];
                        txt=  [self.tableView  cellForRowAtIndexPath:act].contentView.subviews[0];
        NSString* tran= txt.text;
        
        [newLection addEntryWithOrigninal:org andTranslation:tran ];
    }
    NSLog(@"%@",newLection.entries);
}
- (IBAction)tap:(id)sender {
     [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell;
    if(indexPath.row==0){
        cell= [tableView dequeueReusableCellWithIdentifier:@"original"];
        UITextField* txtField=cell.contentView.subviews[0];
        txtField.placeholder=@"Sprache 1";

    }else{
        cell= [tableView dequeueReusableCellWithIdentifier:@"translation"];
        UITextField* txtField=cell.contentView.subviews[0];
        txtField.placeholder=@"Sprache 2";
    }
    return cell;
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
