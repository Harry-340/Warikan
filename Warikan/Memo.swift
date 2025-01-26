//
//  Memo.swift
//  Warikan
//
//  Created by Mishima Haruto on 1/26/25.
//

import Foundation
import RealmSwift

class Memo: Object{
    @Persisted var name: String = ""
    @Persisted var flag: Int = 0
    @Persisted var optionAmount: Int = 0
    @Persisted var resultAmount: Int = 0
}
