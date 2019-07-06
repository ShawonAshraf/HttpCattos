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
                // TODO: show an alert
            }
        }
    }
    
    // MARK: event handler for refresh button
    @IBAction func refreshButtonTapped(_ sender: Any) {
        setImageToImageView()
    }
}

