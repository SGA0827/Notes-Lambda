//
//  NotesTableViewCell.swift
//  Notes (iOS PT1)
//
//  Created by Sean Aldridge on 4/29/19.
//  Copyright © 2019 Sean Aldridge. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NotesTableViewCell)
}

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    var note: Note? {
        didSet {
            self.updateView()
            //update views
        }
    }
    
    weak var delegate: NoteTableViewCellDelegate?
    
    private func updateView() {
        guard let note = self.note else { return }
        self.noteLabel.text = note.text
        
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        self.delegate?.shareNote(for: self)
    }
}
