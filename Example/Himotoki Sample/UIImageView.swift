//
//  UIImageView.swift
//  APIKitExt
//
//  Created by DTVD on 1/9/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFrom(url: String) {
        guard let url = URL(string: url) else {return}
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
            guard let data = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
