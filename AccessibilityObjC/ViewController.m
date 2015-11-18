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
@property (weak, nonatomic) UITableView *requestdObjects;
@property (nonatomic) SelectedCell *selectedCell;




@end

@implementation ViewController {
    NSArray *numberOfCells;
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
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

// must convert the following to ObjC
//func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    
//    checkWhichTableView(tableView)
//    
//    switch selectedCell {
//        
//    case .CellOne:
//        let cellName = "cellOne"
//        requestedObjects = tableView.dequeueReusableCellWithIdentifier(cellName)!
//    case .CellTwo:
//        let cellName = "CellTwo"
//        requestedObjects = tableView.dequeueReusableCellWithIdentifier(cellName)!
//        
//    }
//    
//    return requestedObjects.count
//}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self checkWhichTableView:tableView];
    
    switch (_selectedCell) {
        case CellOne:
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne"];
            break;
            
        case CellTwo:
            
            break;
            
        default:
            break;
    }
    
    return [numberOfCells count];
}



 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne" forIndexPath:indexPath];
 
 // Configure the cell...
 
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
    
    if (tableView == _firstTable) {
        _selectedCell = CellOne;
    } else if (tableView == _secondTable){
        _selectedCell = CellTwo;
    }
    return tableView;
}


@end
