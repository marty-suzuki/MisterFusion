//
//  Array+NSLayoutConstraint.swift
//  MisterFusion
//
//  Created by Taiki Suzuki on 2015/11/18.
//  Copyright © 2015年 Taiki Suzuki. All rights reserved.
//

import UIKit

extension Array where Element: NSLayoutConstraint {
    public func firstItem(_ view: UIView) -> [Element] {
        return filter { $0.firstItem as? UIView == view }
    }
    
    public func firstAttribute(_ attribute: MisterFusion.Attribute) -> [Element] {
        return filter { $0.firstAttribute == attribute }
    }
    
    public func relation(_ relation: MisterFusion.Relation) -> [Element] {
        return filter { $0.relation == relation }
    }
    
    public func secondItem(_ view: UIView) -> [Element] {
        return filter { $0.secondItem as? UIView == view }
    }
    
    public func secondAttribute(_ attribute: MisterFusion.Attribute) -> [Element] {
        return filter { $0.secondAttribute == attribute }
    }
}

extension NSArray {
    @objc(FirstItem)
    public var firstItem: (UIView) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { view in
            return array.filter { $0.firstItem as? UIView == view } as NSArray
        }
    }

    @objc(FirstAttribute)
    public var firstAttribute: (MisterFusion.Attribute) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { attribute in
            return array.filter { $0.firstAttribute == attribute } as NSArray
        }
    }

    @objc(SecondItem)
    public var secondItem: (UIView) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { view in
            return array.filter { $0.secondItem as? UIView == view } as NSArray
        }
    }

    @objc(SecondAttribute)
    public var secondAttribute: (MisterFusion.Attribute) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { attribute in
            return array.filter { $0.secondAttribute == attribute } as NSArray
        }
    }
    
    @objc(Reration)
    public var reration: (MisterFusion.Relation) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { relation in
            return array.filter { $0.relation == relation } as NSArray
        }
    }
}
