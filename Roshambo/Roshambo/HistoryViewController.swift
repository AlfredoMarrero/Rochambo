//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Alfredo M. on 1/18/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var historyArray: [RPSstruct] = []
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyTableCell")
        var gameResult: String
        if(self.historyArray[indexPath.row].playResult == RPSstruct.gameResult.loss){
            gameResult = "Loss."
        }
        else if(self.historyArray[indexPath.row].playResult == RPSstruct.gameResult.win){
            gameResult = "Win!"
        }
        else{
            gameResult = "A tie.."
        }
        
        cell?.textLabel?.text = gameResult
        cell?.imageView?.image = UIImage(named: self.historyArray[indexPath.row].imageName)
        
        // If the cell has a detail label, we will put the evil scheme in.
        if let detailTextLabel = cell?.detailTextLabel {
            detailTextLabel.text = self.historyArray[indexPath.row].messageToDisplay
        }
        
        return cell!
    }
}
