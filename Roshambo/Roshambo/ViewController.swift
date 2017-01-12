//
//  ViewController.swift
//  Roshambo
//
//  Created by Alfredo M. on 1/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    private var gameResultArray: [String] = ["PaperCoversRock", "RockCrushesScissors", "ScissorsCutPaper", "itsATie"]
    enum play: Int {case rock = 0, paper, scissors}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func oponentsPlay() -> Int{
        let randomValue = arc4random() % 3;
        return Int(randomValue);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! ResultViewController
        if(segue.identifier == "scissorSegue"){
            let resultVCInfo = self.getImageToDisplay( buttonSelected: play.scissors)
            controller.imageToDisplay = resultVCInfo.imgeName
            controller.msgToDisplay = resultVCInfo.msg
        }
        else {
            let resultVCInfo = self.getImageToDisplay( buttonSelected: play.paper)
            controller.imageToDisplay = resultVCInfo.imgeName
            controller.msgToDisplay = resultVCInfo.msg
        }
    }
    
    @IBAction func showResult(_ sender: UIButton){
        
        switch (sender.tag){
        case play.rock.rawValue:
            var controller: ResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            let resultVCInfo = self.getImageToDisplay( buttonSelected: play.rock)
            controller.imageToDisplay = resultVCInfo.imgeName
            controller.msgToDisplay = resultVCInfo.msg
            present(controller, animated: true, completion: nil)
        case play.paper.rawValue:
            performSegue(withIdentifier: "showResult", sender: self)
        default:
            break
        }
    }
    
    func getImageToDisplay (buttonSelected: play) -> (imgeName: String, msg: String){
        let computerPlay = play(rawValue: oponentsPlay())
        
        switch (buttonSelected){
        case play.rock:
            if(computerPlay == play.paper){
                
                return ("PaperCoversRock", "Paper Covers Rock. You lost :(")
            }
            else if computerPlay == play.scissors{
                return ("RockCrushesScissors", "Rock Crushes Scissors. You win! :)")
            }
        case play.paper:

            if (computerPlay == play.rock){
                return ("PaperCoversRock", "Paper Covers Rock. You Win! :)")
            }
            else if(computerPlay == play.scissors){
                return ("ScissorsCutPaper","Scissors Cut Paper. You lost :(")
            }
        case play.scissors:
            if(computerPlay == play.rock){
                return ("RockCrushesScissors", "Rock Crushes Scissors. You lost :(")
            }
            else if(computerPlay == play.paper){
                return ("ScissorsCutPaper", "Scissors Cut Paper. You Win! :)")
            }
        }
        
        return ("itsATie", "Try again!!")
    }

}

