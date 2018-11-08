//
//  Helper.swift
//  Notes
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import Foundation

func isNoteLocked(_ lockStatus: LockStatus) -> Bool {
    if lockStatus == .locked {
        return true
    } else {
        return false
    }
}

func lockStatusFlipper(_ lockStatus: LockStatus) -> LockStatus{
    if lockStatus == .locked {
        return .unLocked
    } else {
        return .locked
    }
}

