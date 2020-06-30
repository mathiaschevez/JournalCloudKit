//
//  EntryError.swift
//  JournalCloudKit
//
//  Created by Mathias on 6/29/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

enum EntryError: LocalizedError {
    case ckError(Error)
    case couldNotUnwrap
}
