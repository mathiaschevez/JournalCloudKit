//
//  DateExtension.swift
//  JournalCloudKit
//
//  Created by Mathias on 6/29/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

extension Date {
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
