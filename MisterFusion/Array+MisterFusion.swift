//
//  Array+NSLayoutConstraint.swift
//  MisterFusion
//
//  Created by Taiki Suzuki on 2015/11/18.
//  Copyright © 2015年 Taiki Suzuki. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension Array where Element: NSLayoutConstraint {
    public func firstItem(_ view: View) -> [Element] {
        return filter { $0.firstItem as? View == view }
    }
    
    public func firstAttribute(_ attribute: Attribute) -> [Element] {
        return filter { $0.firstAttribute == attribute }
    }
    
    public func relation(_ relation: Relation) -> [Element] {
        return filter { $0.relation == relation }
    }
    
    public func secondItem(_ view: View) -> [Element] {
        return filter { $0.secondItem as? View == view }
    }
    
    public func secondAttribute(_ attribute: Attribute) -> [Element] {
        return filter { $0.secondAttribute == attribute }
    }
}

extension NSArray {
    @objc(FirstItem)
    public var firstItem: (View) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { view in
            return array.filter { $0.firstItem as? View == view } as NSArray
        }
    }

    @objc(FirstAttribute)
    public var firstAttribute: (Attribute) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { attribute in
            return array.filter { $0.firstAttribute == attribute } as NSArray
        }
    }

    @objc(SecondItem)
    public var secondItem: (View) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { view in
            return array.filter { $0.secondItem as? View == view } as NSArray
        }
    }

    @objc(SecondAttribute)
    public var secondAttribute: (Attribute) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { attribute in
            return array.filter { $0.secondAttribute == attribute } as NSArray
        }
    }
    
    @objc(Reration)
    public var reration: (Relation) -> NSArray {
        guard let array = self as? [NSLayoutConstraint] else {
            return { _ in [] }
        }
        return { relation in
            return array.filter { $0.relation == relation } as NSArray
        }
    }
}
