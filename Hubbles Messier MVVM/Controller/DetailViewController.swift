//
//  DetailViewController.swift
//  Hubbles Messier MVVM
//
//  Created by Fernando Gomes on 23/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var messierViewModel: MessierViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageCompletionClosure = { (imageData: Data) -> Void in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1, animations: {
                    self.imageView.alpha = 1.0
                    self.imageView?.image = UIImage(data: imageData as Data)
                    self.view.setNeedsDisplay()
                })
                self.activityIndicator.stopAnimating()
            }
        }
        
        activityIndicator.startAnimating()
        titleLabel.text = messierViewModel?.formalName
        updatedLabel.text = messierViewModel?.dateUpdated
        subtitleLabel.text = messierViewModel?.commonName
        descriptionLabel.attributedText = messierViewModel?.textDescription
        messierViewModel?.download(completionHandler: imageCompletionClosure)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
