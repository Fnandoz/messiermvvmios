//
//  ViewController+TableViewDelegate.swift
//  Hubbles Messier MVVM
//
//  Created by Fernando Gomes on 23/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
