//
//  String+Tools.swift
//  kino
//
//  Created by KODE_H6 on 29.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    ///  По ключу локализации в *Localizable.strings* возвращает строку для текущей/дефолтной локали
    var localize: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

extension NSString {
    var localize: String {
        return (self as String).localize
    }
}
