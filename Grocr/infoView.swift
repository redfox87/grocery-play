//
//  infoView.swift
//  Grocr
//
//  Created by Thomas Bloss on 5/20/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation
import UIKit

class infoView: UIViewController {



    @IBOutlet weak var infoLabel: UILabel!
    var receivedText = ""
    var receivedText2 = ""

    var receivedImage: UIImage? = UIImage(named: "1")
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var newRefPath: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(receivedImage)
        infoLabel.text = receivedText
        infoImage.image = receivedImage!
        newRefPath.text = receivedText2
        
    }

    override func viewWillAppear(animated: Bool) {

    }
}