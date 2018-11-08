//
//  NoteDetailsVC.swift
//  Notes
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import UIKit

class NoteDetailsVC: UIViewController {

    @IBOutlet weak var noteTxt: UITextView!
    
    var note: Note!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTxt.text = note.note
    }
    
    @IBAction func lockNoteBtnPressed(_ sender: Any) {
        noteArray[index].lockStatus = lockStatusFlipper(note.lockStatus)
        navigationController?.popViewController(animated: true)
    }
}
