//
//  NotesViewController.swift
//  Notes (iOS PT1)
//
//  Created by Sean Aldridge on 4/29/19.
//  Copyright © 2019 Sean Aldridge. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NoteTableViewCellDelegate {
    
    
    //Outlets and Properties
    let notesController = NotesController()
     @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTableView.delegate = self
        self.notesTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.notesController.notes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NotesTableViewCell else { return cell}
        
        let note = notesController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        
        return cell
    }
   
    @IBAction func saveNoteButtonTapped(_ sender: Any) {
        guard let text = self.noteTextView.text else {return}
        
        notesController.createNote(withText: text)
        self.noteTextView.text = nil
        self.notesTableView.reloadData()
    }
    
    func shareNote(for cell: NotesTableViewCell) {
        
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
        
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

}
