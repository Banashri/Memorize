//
//  Array+Only.swift
//  Memorize
//
//  Created by Banashri Mandal on 17.01.21.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
