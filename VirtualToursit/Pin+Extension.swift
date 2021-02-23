//
//  Pin+Extension.swift
//  VirtualToursit
//
//  Created by Robert Jeffers on 2/22/21.
//

import Foundation
import CoreData

extension Pin {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
