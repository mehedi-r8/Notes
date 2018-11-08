//
//  Note.swift
//  Notes
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import Foundation

class Note {
    public private(set) var note: String
    public var lockStatus: LockStatus
    
    init(note: String, lockStatus: LockStatus) {
        self.note = note
        self.lockStatus = lockStatus
    }
}
