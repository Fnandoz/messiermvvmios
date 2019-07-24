//
//  MessierViewModel.swift
//  Hubbles Messier MVVM
//
//  Created by Fernando Gomes on 23/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation
import UIKit

public typealias ImageDownloadCompletionClosure = (_ imageData: Data) -> Void

var messierViewModel: [MessierViewModel] =
    [MessierViewModel(messierDataModel: Messier1),
     MessierViewModel(messierDataModel: Messier8),
     MessierViewModel(messierDataModel: Messier57)]

class MessierViewModel {
    private let messierDataModel: MessierDataModel
    private var imageUrl: URL
    private var updatedDate: Date?
    
    init(messierDataModel: MessierDataModel) {
        self.messierDataModel = messierDataModel
        self.imageUrl = URL(string: messierDataModel.imageLink)!
    }
    
    public var formalName: String {
        return "Formal name " + messierDataModel.formalName
    }
    
    public var commonName: String {
        return "Common name " + messierDataModel.commonName
    }
    
    public var dateUpdated: String {
        let dateString = String(messierDataModel.updateDate.year) + "-" +
            String(messierDataModel.updateDate.month) + "-" +
            String(messierDataModel.updateDate.day)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM dd, yyyy"
        
        if let date = dateFormatterGet.date(from: dateString) {
            updatedDate = date
            return "Updated: " + dateFormatterPrint.string(from: date)
        }
        else {
            return "There was an error decoding the string"
        }
    }
    
    public var textDescription: NSAttributedString {
        let fontAttributes = [NSAttributedString.Key.font:  UIFont(name: "Georgia", size: 14.0)!, NSAttributedString.Key.foregroundColor: UIColor.blue]
        let markedUpDescription = NSAttributedString(string: messierDataModel.description, attributes:fontAttributes)
        return markedUpDescription
    }
    
    public var thumbnail: String {
        return messierDataModel.imageLink
    }
    
    func download(completionHandler: @escaping ImageDownloadCompletionClosure) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: imageUrl)
        
        let task = session.dataTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    let rawImageData = tempLocalUrl
                    completionHandler(rawImageData)
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
            } else {
                print("Error took place while downloading a file. Error description: \(String(describing: error?.localizedDescription))")
            }
        }
        
        task.resume()
    }
    
}
