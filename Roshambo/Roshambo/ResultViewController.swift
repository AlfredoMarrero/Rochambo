//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Alfredo M. on 1/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var displayResultMsg: UILabel!
    @IBOutlet weak var gameResult: UIImageView!
    
//    var ViewInfo: [String] = []
    
    var imageToDisplay: String?
    var msgToDisplay: String?
    var playResult: RPSstruct.gameResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        gameResult.image = UIImage(named: imageToDisplay!)
        
        let resultString: String
        if(playResult == RPSstruct.gameResult.loss){
            resultString = "You loss."
        }
        else if(playResult == RPSstruct.gameResult.win){
            resultString = "You Win!"
        }
        else{
            resultString = ""
        }
        
        displayResultMsg.text = msgToDisplay! + " " + resultString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
