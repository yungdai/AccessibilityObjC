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
    
    tableData1 = [NSArray  arrayWithObjects:@"Row 1", @"Row 2", @"Row 3", nil];
    tableData2 = [NSArray  arrayWithObjects:@"From Row 1", @"From Row 2", @"From Row 3", nil];
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

     [self checkWhichTableView:tableView];
     
         switch (self.selectedTable) {
             case TableOne:
                 self.cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
                 
                 if (self.cell == nil) {
                     self.cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellName];
                 }
                 
                 self.cell.textLabel.text = [tableData1 objectAtIndex:indexPath.row];
     
             case TableTwo:
                 self.cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
                 
                 if (self.cell == nil) {
                     self.cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellName];
                 }
                 
                 self.cell.textLabel.text = [tableData2 objectAtIndex:indexPath.row];
         }
     
     return self.cell;
 }

- (void)addAccessiblityElements {
    
    // create the lables for the two respective tables
    _firstTable.accessibilityLabel = @"This is a custom Accounts Table";
    _secondTable.accessibilityLabel = @"This is a custo Results Table";
    
    
    
    // create the accessbility hint for the two tables
    _firstTable.accessibilityHint = @"This table shows accounts";
    _secondTable.accessibilityHint = @"This table shows Results";
    
    
    
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
