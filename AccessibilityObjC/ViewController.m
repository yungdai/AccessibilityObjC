//
//  ViewController.m
//  AccessibilityObjC
//
//  Created by Yung Dai on 2015-11-17.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

#import "ViewController.h"
#import "AccessibilityObjC-Swift.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet FirstTable *firstTable;
@property (weak, nonatomic) IBOutlet SecondTable *secondTable;
@property (strong, nonatomic) FirstTableViewCell *firstTableViewCell;
@property (strong, nonatomic) SecondTableViewCell *secondTableViewCell;
@property (weak, nonatomic) TestData *testData;
@property (weak, nonatomic) UITableViewCell *cell;
@property (nonatomic) SelectedTable selectedTable;

@end

@implementation ViewController {
    NSString *cellName;
    NSArray *tableData1;
    NSArray *tableData2;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableData1 = [NSArray  arrayWithObjects:@"Chequing", @"Savings", @"Credit Cards", nil];
    tableData2 = [NSArray  arrayWithObjects:@"More Info about Chequing", @"More Information about Savings", @"More Information about Credit Cards", nil];
    [self addAccessiblityElements];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self checkWhichTableView:tableView];
    
    switch (self.selectedTable) {
        case TableOne:
            section = [tableData1 count];
            break;
            
        case TableTwo:
            section = [tableData2 count];
            break;
    }
    

    return section;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
     // declare the colum row data
     NSInteger row = indexPath.row;
//     NSString *columnOneData = [tableData1 objectAtIndex: row];
//     NSString *columnTwoData = [tableData2 objectAtIndex: row];
     
     NSArray *testData = [[TestData alloc] init];
     

     
     
     
     [self checkWhichTableView:tableView];
     switch (self.selectedTable) {
             
         case TableOne:
             
             self.firstTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cellOne" forIndexPath:indexPath];
             self.firstTableViewCell.firstTableViewCellLabel.text = [tableData1 objectAtIndex:indexPath.row];
             self.firstTableViewCell.firstTableViewCellLabel.accessibilityLabel = [NSString stringWithFormat:@"%@ and something from %@", self.firstTableViewCell.firstTableViewCellLabel.text, columnTwoData];
             NSLog(@"%@ and something from %@", self.firstTableViewCell.firstTableViewCellLabel.text, columnTwoData);
             return self.firstTableViewCell;
             
         case TableTwo:
             
             self.secondTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"cellTwo" forIndexPath:indexPath];
             self.secondTableViewCell.secondTableViewCellLabel.text = [tableData2 objectAtIndex:indexPath.row];
             self.secondTableViewCell.secondTableViewCellLabel.accessibilityLabel = [NSString stringWithFormat:@"%@ and something from %@", self.secondTableViewCell.secondTableViewCellLabel.text, columnOneData];
             NSLog(@"%@ and something from %@", self.secondTableViewCell.secondTableViewCellLabel.text, columnOneData);
             return self.secondTableViewCell;
     }
     
 }

- (void)addAccessiblityElements {
    
    // create the lables for the two respective tables
    self.firstTable.accessibilityLabel = @"This is a custom accounts table";
    self.secondTable.accessibilityLabel = @"This is a custom results table";

    // create the accessbility hint for the two tables
    self.firstTable.accessibilityHint = @"This table shows accounts";
    self.secondTable.accessibilityHint = @"This table shows results";
}

// ObjC

- (UITableView *)checkWhichTableView: (UITableView *)tableView {
    
    if (tableView == self.firstTable) {
        cellName = @"cellOne";
        self.selectedTable = TableOne;
    }
    else if (tableView == self.secondTable){
        cellName = @"cellTwo";
        self.selectedTable = TableTwo;
    }
    return tableView;
}


@end
