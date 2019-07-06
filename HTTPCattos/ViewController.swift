//
//  ViewController.swift
//  HTTPCattos
//
//  Created by Shawon Ashraf on 7/6/19.
//  Copyright © 2019 Shawon Ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cattoImageView: UIImageView!
    @IBOutlet weak var refresh: UIBarButtonItem!
    
    var cattoGetter = CattoNetworking()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // load an image initially
        setImageToImageView()
    }

    // MARK: sets image from network response to imageView
    func setImageToImageView() {
        cattoGetter.getACattoAsap { (cattoData) in
            if let catto = cattoData {
                // referenced imageView from main thread
                // as iOS SDK warns not to use images from
                // a background thread
                DispatchQueue.main.sync {
                    self.cattoImageView.image = UIImage(data: catto)
                }
            } else {
                // show an alert
                self.showErrorAlertOnImageDataBeingNil()
            }
        }
    }
    
    // MARK: alert function on image data being nil
    func showErrorAlertOnImageDataBeingNil() {
        let ac = UIAlertController(title: "No cattos? 😢", message: "Seems we're having some problems getting cattos from the server.", preferredStyle: .alert)
        
        let dismiss = UIAlertAction(title: "Okay!", style: .default, handler: nil)
        ac.addAction(dismiss)
        
        present(ac, animated: true)
    }
    
    // MARK: event handler for refresh button
    @IBAction func refreshButtonTapped(_ sender: Any) {
        setImageToImageView()
    }
}

