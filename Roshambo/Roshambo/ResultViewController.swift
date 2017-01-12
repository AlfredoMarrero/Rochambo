//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Alfredo M. on 1/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var gameResult: UIImageView!
    var imageToDisplay: String?
    var msgToDisplay: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        gameResult.image = UIImage(named: imageToDisplay!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
