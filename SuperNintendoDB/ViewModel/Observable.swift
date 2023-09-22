//
//  Observable.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 21/09/2023.
//

import Foundation

// Clase Observable genérica que puede contener cualquier tipo de valor
class Observable<T> {

    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
            
        }
    }

    init(_ value: T? = nil) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?

    func bind(_ listener: @escaping((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
