//
//  Observer.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import Foundation

class Observer<T> {
    var value:T? {
        didSet {
            observerBlock?(value)
        }
    }
    init(value:T?) {
        self.value = value
    }
    private var observerBlock: ((T?) -> Void)?

    func addObserver(observer:@escaping(T?) -> Void) {
        self.observerBlock = observer
    }
}
