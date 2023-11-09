//
//  HelloComponent.swift
//  Demo
//
//  Created by wangxiaobo on 2023/11/7.
//
import Foundation
import Strada

class HelloComponent: BridgeComponent {
    override class var name: String { "hello" }

    override func onReceive(message: Message) {
        print(#function, message)
    }
}
