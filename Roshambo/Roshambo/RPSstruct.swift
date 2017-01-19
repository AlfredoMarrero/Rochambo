//
//  RPSstruct.swift
//  Roshambo
//
//  Created by Alfredo M. on 1/18/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import Foundation

struct RPSstruct {
    var imageName: String
    var messageToDisplay: String
    enum gameResult: Int{case win = 0, loss, tie}
    var playResult: gameResult
    
    init(_ imageN : String, _ msg : String, _ result : gameResult) {
        imageName = imageN
        messageToDisplay = msg
        playResult = result;
    }
    
}
