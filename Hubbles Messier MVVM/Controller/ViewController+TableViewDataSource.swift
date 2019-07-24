//
//  ViewController+TableViewDataSource.swift
//  Hubbles Messier MVVM
//
//  Created by Fernando Gomes on 23/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messierViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "messierCell")
        tableViewCell?.textLabel?.text = messierViewModel[indexPath.row].formalName
        tableViewCell?.detailTextLabel?.text = messierViewModel[indexPath.row].commonName
        return tableViewCell!
    }
    
    
}
