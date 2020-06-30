//
//  Entry.swift
//  JournalCloudKit
//
//  Created by Mathias on 6/29/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation
import CloudKit

struct EntryConstants {
    static let titleKey = "title"
    static let bodyKey = "body"
    static let timeStampKey = "timestamp"
    static let recordTypeKey = "Entry"
}

class Entry {
    let title: String
    let body: String
    let timeStamp: Date
    let ckRecordID: CKRecord.ID
    
    init(title: String, body: String, timeStamp: Date = Date(), ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
        self.ckRecordID = ckRecordID
    }
}

extension CKRecord {
    convenience init(entry: Entry) {
        self.init(recordType: EntryConstants.recordTypeKey, recordID: entry.ckRecordID)
        self.setValuesForKeys([
            EntryConstants.titleKey: entry.title,
            EntryConstants.bodyKey: entry.body,
            EntryConstants.timeStampKey: entry.timeStamp
        ])
    }
}

extension Entry {
    convenience init?(ckRecord: CKRecord) {
        guard let title = ckRecord[EntryConstants.titleKey] as? String,
            let body = ckRecord[EntryConstants.bodyKey] as? String,
            let timeStamp = ckRecord[EntryConstants.timeStampKey] as? Date
            else {return nil}
        
        self.init(title: title, body: body, timeStamp: timeStamp)
    }
}
