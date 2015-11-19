//
//  MainSwiftViewController.swift
//  AccessibilityObjC
//
//  Created by Yung Dai on 2015-11-18.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

@objc class MainSwiftViewController: UIViewController {

    
    @IBOutlet weak var firstTable: FirstTable!
    @IBOutlet weak var secondTable: SecondTable!
    let tableData1 = ["Row 1", "Row 2", "Row 3"]
    let tableData2 = ["From Row 1", "From Row 2", "From Row 3"]
    
    var requestedObjects: AnyObject = []
    
    
    enum SelectedCell {
        
        case CellOne
        case CellTwo
        
    }
    
    var selectedCell: SelectedCell = .CellOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAccessibilityElements()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        addAccessibilityElements()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Accessability
    
    func addAccessibilityElements() {
        
        // initialise the the elements as accessible
        firstTable.isAccessibilityElement = true
        secondTable.isAccessibilityElement = true
        
        
        
        // create the lables for the two respective tables
        firstTable.accessibilityLabel = "This is a custom Accounts Table"
        secondTable.accessibilityLabel = "This is a custo Results Table"
        
        
        
        // create the accessbility hint for the two tables
        firstTable.accessibilityHint = "This table shows accounts"
        secondTable.accessibilityHint = "This table shows Results"
        
        
    }
    
    
    // MARK: TableViewData
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        checkWhichTableView(tableView)
        
        switch selectedCell {
            
        case .CellOne:
            section == tableData1.count


        case .CellTwo:
            section == tableData2.count
        }

        return section
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellName: String!
        
        checkWhichTableView(tableView)
        
        switch selectedCell {
            
        case .CellOne:
            cellName = "cellOne"
            
        case .CellTwo:
            cellName = "cellTwo"
            
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName) as UITableViewCell!
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // check to see which tableView is selected
        checkWhichTableView(tableView)
        
        switch selectedCell {
            
        case .CellOne:
            UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, secondTable)
            
        case .CellTwo:
            UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, firstTable)
        }
    }
    
    // check to see which table is selected
    
    func checkWhichTableView(tableView: UITableView) -> UITableView {
        
        // check to see which tableView is selected
        if tableView == firstTable {
            selectedCell = .CellOne
        } else if tableView == secondTable {
            selectedCell = .CellTwo
        }
        
        return tableView
    }

}
