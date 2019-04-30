//
//  NotesController.swift
//  Notes (iOS PT1)
//
//  Created by Sean Aldridge on 4/29/19.
//  Copyright © 2019 Sean Aldridge. All rights reserved.
//

import Foundation

class NotesController {
    
    init() {
        //create test data
        createNote(withText: "Walk the dog!")
        createNote(withText: "Eat Lunch")
        createNote(withText: "Swift is awesome")
    }
    //source of all truth
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note (text: text)
        
        notes.append(note)
        
    }
}
