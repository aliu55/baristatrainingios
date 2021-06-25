//
//  Extension.swift
//  BaristaTraining
//
//  Created by MacBook Pro on 6/25/21.
//

import Foundation

import SwiftUI

//extension UINavigationController {
//    open override func viewWillLayoutSubviews() {
//        // Remove back button text
//        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Restart", style: .plain, target: nil, action: nil)
//    }
//}

extension UINavigationBar {
    static func changeAppearance(clear: Bool) {
        let appearance = UINavigationBarAppearance()
        
        if clear {
            appearance.configureWithTransparentBackground()
        } else {
            appearance.configureWithDefaultBackground()
        }
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

