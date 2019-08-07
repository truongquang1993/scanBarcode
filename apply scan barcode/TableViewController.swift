//
//  TableViewController.swift
//  apply scan barcode
//
//  Created by Trương Quang on 8/5/19.
//  Copyright © 2019 truongquang. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let passDataMain = Notification.Name(rawValue: "passDataMain")
}

class TableViewController: UITableViewController {
    
    @IBOutlet weak var labelBarcode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func csanBarcode(_ sender: Any) {
        let scanVC = storyboard?.instantiateViewController(withIdentifier: "CsanView") as! CsanViewController
        NotificationCenter.default.addObserver(self, selector: #selector(updateBarcode), name: .passDataMain, object: nil)
        present(scanVC, animated: true, completion: nil)
    }
    
    @objc func updateBarcode(notification: Notification) {
        let barcode = notification.object as! String
        labelBarcode.text = barcode
    }

}
