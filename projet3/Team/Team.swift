//
//  Team.swift
//  projet3
//
//  Created by Christophe DURAND on 20/11/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Team { // To init parameters like "name" of the team for the feature
    
    var name: String
    var characterArray = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
    func teamDescription() { // To print the name of the team and to show the character's descriptions of each team during the game
        
        print("==========================")
        print("Team's name: \(self.name) ")
        print("")
        
        for c in characterArray {
            c.characterDescription()
        }
    }
}
