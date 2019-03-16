//
//  ExtensionUIView.swift
//  StretchyHeader
//
//  Created by Tim Ng on 3/15/19.
//  Copyright © 2019 Tim Ng. All rights reserved.
//

import UIKit

struct AnchoredContraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredContraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: padding.right)
        }
        
//        if let bottom = bottom {
//            anchoredConstraints.bottom = bottomAnchor
//        }
        
        
    }
}
