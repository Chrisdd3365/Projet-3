//
//  Team.swift
//  projet3
//
//  Created by Christophe DURAND on 20/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Team { 
    
    var name: String
    var characterArray = [Character]()
    

    init(name: String) {
        self.name = name
    }
    
    func teamDescription() {
        print("==========================")
        print("Team's name: \(self.name) ")
        print("")
        for c in characterArray {
            c.characterDescription()
        }
    }
}
