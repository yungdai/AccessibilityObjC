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
@property (weak, nonatomic) UITableViewCell *requestdObjects;
@property (nonatomic) SelectedCell selectedCell;

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
    
    tableData1 = [NSArray  arrayWithObjects:@"Row 1", @"Row 2", @"Row 3",nil];
    
    tableData2 = [NSArray  arrayWithObjects:@"Row 1", @"Row 2", @"Row 3",nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self checkWhichTableView:tableView];
    
    switch (self.selectedCell) {
        case CellOne:
            section = [tableData1 count];
            break;
            
        case CellTwo:
            section = [tableData2 count];
            break;
            
        default:
            break;
    }
    

    return section;
}

// convert from Swift to Objc
//func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//    
//    var cellName: String!
//    
//    checkWhichTableView(tableView)
//    
//    switch selectedCell {
//        
//    case .CellOne:
//        cellName = "cellOne"
//        
//    case .CellTwo:
//        cellName = "cellTwo"
//        
//    }
//    
//    let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName) as UITableViewCell!
//    return cell
//}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

     [self checkWhichTableView:tableView];
     
         switch (self.selectedCell) {
             case CellOne:
                 self.requestdObjects = [tableView dequeueReusableCellWithIdentifier:cellName];
                 break;
     
             case CellTwo:
                 self.requestdObjects = [tableView dequeueReusableCellWithIdentifier:cellName];
                 break;
     
             default:
                 break;
         }
     
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
     
     if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellName];
     }
     
     cell.textLabel.text = [tableData1 objectAtIndex:indexPath.row];
     return cell;
 }

// MARK: SWift to Objective C method

// Swift
//func checkWhichTableView(tableView: UITableView) -> UITableView {
//    
//    // check to see which tableView is selected
//    if tableView == firstTable {
//        selectedCell = .CellOne
//    } else if tableView == secondTable {
//        selectedCell = .CellTwo
//    }
//    
//    return tableView
//}

// ObjC

-(UITableView *)checkWhichTableView: (UITableView *)tableView {
    
    if (tableView == self.firstTable) {
        cellName = @"cellOne";
        self.selectedCell = CellOne;
    }
    else if (tableView == self.secondTable){
        cellName = @"cellTwo";
        self.selectedCell = CellTwo;
    }
    return tableView;
}


@end
