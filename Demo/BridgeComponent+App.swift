//
//  BridgeComponent+App.swift
//  Demo
//
//  Created by wangxiaobo on 2023/11/7.
//

import Strada

extension BridgeComponent {
    static var allTypes: [BridgeComponent.Type] {
        [
            HelloComponent.self,
            FormComponent.self
        ]
    }
}
