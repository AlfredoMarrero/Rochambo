//
//  RockPaperScissorsViewController.swift
//  Roshambo
//
//  Created by Alfredo M. on 1/11/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    var historyInfoArray: [RPSstruct] = []

//    private var vareResultArray: [String] = ["PaperCoversRock", "RockCrushesScissors", "ScissorsCutPaper", "itsATie"]
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
        
        
        if(segue.identifier == "scissorSegue" || segue.identifier == "showResult"){
            let controller = segue.destination as! ResultViewController
            let resultVCInfo: RPSstruct
            if(segue.identifier == "scissorSegue"){
                resultVCInfo = self.getInfoToDisplay( buttonSelected: play.scissors)
            }
            else{
                resultVCInfo = self.getInfoToDisplay( buttonSelected: play.paper)
            }
            
            controller.imageToDisplay = resultVCInfo.imageName
            controller.msgToDisplay = resultVCInfo.messageToDisplay
            controller.playResult = resultVCInfo.playResult
        }
        else if (segue.identifier == "historyTableView"){
            let controller = segue.destination as! HistoryViewController
            controller.historyArray = historyInfoArray
        }
    }
    
    @IBAction func showResult(_ sender: UIButton){
        
        switch (sender.tag){
        case play.rock.rawValue:
            var controller: ResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            let resultVCInfo = self.getInfoToDisplay( buttonSelected: play.rock)
            controller.imageToDisplay = resultVCInfo.imageName
            controller.msgToDisplay = resultVCInfo.messageToDisplay
            controller.playResult = resultVCInfo.playResult
            present(controller, animated: true, completion: nil)
        case play.paper.rawValue:
            performSegue(withIdentifier: "showResult", sender: self)
        default:
            break
        }
    }
    
    func getInfoToDisplay (buttonSelected: play) -> RPSstruct{
        let computerPlay = play(rawValue: oponentsPlay())
        var playResult = RPSstruct("itsATie", "It's a tie!",  RPSstruct.gameResult.tie)
    
        switch (buttonSelected){
        case play.rock:
            if(computerPlay == play.paper){
                //historyInfoArray.append(RPSstruct("Paper Covers Rock.", false))
                playResult = RPSstruct("PaperCoversRock", "Paper Covers Rock.", RPSstruct.gameResult.loss)
            }
            else if computerPlay == play.scissors{
               // historyInfoArray.append(RPSstruct("Rock Crushes Scissors.", true))
                playResult = RPSstruct("RockCrushesScissors", "Rock Crushes Scissors.", RPSstruct.gameResult.win )
            }
        case play.paper:
            if (computerPlay == play.rock){
                //historyInfoArray.append(RPSstruct("Paper Covers Rock. ", true))
                playResult = RPSstruct("PaperCoversRock", "Paper Covers Rock.", RPSstruct.gameResult.win)
            }
            else if(computerPlay == play.scissors){
                //historyInfoArray.append(RPSstruct("Scissors Cut Paper.", false))
                playResult = RPSstruct("ScissorsCutPaper","Scissors Cut Paper.", RPSstruct.gameResult.loss)
            }
        case play.scissors:
            if(computerPlay == play.rock){
                //historyInfoArray.append(RPSstruct("Rock Crushes Scissors.", false))
                playResult = RPSstruct("RockCrushesScissors", "Rock Crushes Scissors.", RPSstruct.gameResult.loss )
            }
            else if(computerPlay == play.paper){
                 //historyInfoArray.append(RPSstruct("Scissors Cut Paper. ", true))
                playResult = RPSstruct("ScissorsCutPaper", "Scissors Cut Paper.", RPSstruct.gameResult.win)
            }
        }
        
        historyInfoArray.append(playResult)
        return playResult
    }
}

