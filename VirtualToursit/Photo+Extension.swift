//
//  Photo+Extension.swift
//  VirtualToursit
//
//  Created by Robert Jeffers on 2/22/21.
//

import Foundation
import CoreData

extension Photo {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
    
}
