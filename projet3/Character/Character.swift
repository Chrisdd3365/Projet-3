//
//  Character.swift
//  projet3
//
//  Created by Christophe DURAND on 24/10/2017.
//  Copyright © 2017 Christophe DURAND. All rights reserved.
//

import Foundation

class Character { 

    var characterName: String
    let classe: String
    let maxLife: Int
    var currentLife: Int
    var weaponEquipped: String
    var atk: Int
    var mag: Int
    
    init(characterName: String, classe: String, maxLife: Int, currentLife: Int, weaponEquipped: String, atk: Int, mag: Int) {
        self.characterName = characterName
        self.classe = classe
        self.maxLife = maxLife
        self.currentLife = currentLife
        self.weaponEquipped = weaponEquipped
        self.atk = atk
        self.mag = mag
}

    func showCharacter() {
        print("")
        print("==================================")
        print("Character's name: \(characterName)"
            + "\nClasse: \(classe)"
            + "\nHP: \(currentLife)/\(maxLife)"
            + "\nWeapon: \(weaponEquipped)"
            + "\nATK: \(atk)"
            + "\nMAG: \(mag)"
            + "")
    }
}

