//
//  ViewController.swift
//  Hubbles Messier MVVM
//
//  Created by Fernando Gomes on 23/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let destinationViewController = segue.destination as? DetailViewController {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                destinationViewController.messierViewModel = messierViewModel[index]
            }
        }
    }
}

