//
//  ViewController.h
//  AccessibilityObjC
//
//  Created by Yung Dai on 2015-11-17.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

typedef enum { CellOne = 0, CellTwo } SelectedCell;

-(UITableView *)checkWhichTableView: (UITableView *)tableView;


@end

