//
//  NoteCell.swift
//  Notes
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteLbl: UILabel!
    @IBOutlet weak var lockStatusImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(note: Note) {
        if note.lockStatus == .locked {
            lockStatusImg.isHidden = false
            noteLbl.text = "this note is locked, unlock to read"
        } else {
            noteLbl.text = note.note
            lockStatusImg.isHidden = true
        }
    }
}
