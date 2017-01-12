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
             controller.imageToDisplay = self.getImageToDisplay( buttonSelected: play.scissors)
        }
        else {
             controller.imageToDisplay = self.getImageToDisplay( buttonSelected: play.paper)
        }
    }
    
    @IBAction func showResult(_ sender: UIButton){
        
        switch (sender.tag){
        case play.rock.rawValue:
            var controller: ResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            controller.imageToDisplay = self.getImageToDisplay(buttonSelected: play.rock)
            present(controller, animated: true, completion: nil)
        case play.paper.rawValue:
            performSegue(withIdentifier: "showResult", sender: self)
        default:
            break
        }
        
//        if sender.tag == userPlay.rock.rawValue {
//            var controller: ResultViewController
//            controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
//            controller.imageToDisplay = self.getImageToDisplay(buttonSelected: sender.tag)
//            present(controller, animated: true, completion: nil)
//        }
//        else if(sender.tag == userPlay.paper.rawValue)
//        {
//            performSegue(withIdentifier: "showResult", sender: self)
//
//                   }
    }
    
    func getImageToDisplay (buttonSelected: play) -> String{
        let computerPlay = play(rawValue: oponentsPlay())
        
        switch (buttonSelected){
        case play.rock:
            if(computerPlay == play.paper){
                return "PaperCoversRock"
            }
            else if computerPlay == play.scissors{
                return "RockCrushesScissors"
            }
        case play.paper:

            if (computerPlay == play.rock){
                return "PaperCoversRock"
            }
            else if(computerPlay == play.scissors){
                return "ScissorsCutPaper"
            }
        case play.scissors:
            if(computerPlay == play.rock){
                return "RockCrushesScissors"
            }
            else if(computerPlay == play.paper){
                return "ScissorsCutPaper"
            }
        }
        
        return "itsATie"
    }

}

