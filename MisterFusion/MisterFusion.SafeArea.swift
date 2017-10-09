//
//  MisterFusion.SafeArea.swift
//  MisterFusion
//
//  Created by marty-suzuki on 2017/10/10.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
public protocol SafeAreaCompatible {
    associatedtype SafeAreaCompatibleType
    var safeArea: SafeAreaCompatibleType { get }
}

@available(iOS 11.0, *)
public extension SafeAreaCompatible {
    public var safeArea: SafeAreaExtension<Self> {
        return SafeAreaExtension(self)
    }
}

@available(iOS 11.0, *)
public struct SafeAreaExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

@available(iOS 11.0, *)
extension UIView: SafeAreaCompatible {}

@available(iOS 11.0, *)
extension SafeAreaExtension where Base: UIView {
    public var top: MisterFusion { return createMisterFusion(with: .top) }
    
    public var right: MisterFusion { return createMisterFusion(with: .right) }
    
    public var left: MisterFusion { return createMisterFusion(with: .left) }
    
    public var bottom: MisterFusion { return createMisterFusion(with: .bottom) }
    
    public var height: MisterFusion { return createMisterFusion(with: .height) }
    
    public var width: MisterFusion { return createMisterFusion(with: .width) }
    
    public var leading: MisterFusion { return createMisterFusion(with: .leading) }
    
    public var trailing: MisterFusion { return createMisterFusion(with: .trailing) }
    
    public var centerX: MisterFusion { return createMisterFusion(with: .centerX) }
    
    public var centerY: MisterFusion { return createMisterFusion(with: .centerY) }
    
    public var baseline: MisterFusion { return createMisterFusion(with: .lastBaseline) }
    
    public var notAnAttribute: MisterFusion { return createMisterFusion(with: .notAnAttribute) }
    
    public var lastBaseline: MisterFusion { return createMisterFusion(with: .lastBaseline) }
    
    public var firstBaseline: MisterFusion { return createMisterFusion(with: .firstBaseline) }
    
    public var leftMargin: MisterFusion { return createMisterFusion(with: .leftMargin) }
    
    public var rightMargin: MisterFusion { return createMisterFusion(with: .rightMargin) }
    
    public var topMargin: MisterFusion { return createMisterFusion(with: .topMargin) }
    
    public var bottomMargin: MisterFusion { return createMisterFusion(with: .bottomMargin) }
    
    public var leadingMargin: MisterFusion { return createMisterFusion(with: .leadingMargin) }
    
    public var trailingMargin: MisterFusion { return createMisterFusion(with: .trailingMargin) }
    
    public var centerXWithinMargins: MisterFusion { return createMisterFusion(with: .centerXWithinMargins) }
    
    public var centerYWithinMargins: MisterFusion { return createMisterFusion(with: .centerYWithinMargins) }
    
    private func createMisterFusion(with attribute: NSLayoutAttribute) -> MisterFusion {
        return MisterFusion(item: base.safeAreaLayoutGuide, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: nil)
    }
}

@available(iOS 11.0, *)
extension UIView {
    @available(*, unavailable)
    public var SafeAreaTop: MisterFusion { return safeArea.top }
    
    @available(*, unavailable)
    public var SafeAreaRight: MisterFusion { return safeArea.right }
    
    @available(*, unavailable)
    public var SafeAreaLeft: MisterFusion { return safeArea.left }
    
    @available(*, unavailable)
    public var SafeAreaBottom: MisterFusion { return safeArea.bottom }
    
    @available(*, unavailable)
    public var SafeAreaHeight: MisterFusion { return safeArea.height }
    
    @available(*, unavailable)
    public var SafeAreaWidth: MisterFusion { return safeArea.width }
    
    @available(*, unavailable)
    public var SafeAreaLeading: MisterFusion { return safeArea.leading }
    
    @available(*, unavailable)
    public var SafeAreaTrailing: MisterFusion { return safeArea.trailing }
    
    @available(*, unavailable)
    public var SafeAreaCenterX: MisterFusion { return safeArea.centerX }
    
    @available(*, unavailable)
    public var SafeAreaCenterY: MisterFusion { return safeArea.centerY }
    
    @available(*, unavailable)
    public var SafeAreaBaseline: MisterFusion { return safeArea.lastBaseline }
    
    @available(*, unavailable)
    public var SafeAreaNotAnAttribute: MisterFusion { return safeArea.notAnAttribute }
    
    @available(*, unavailable)
    public var SafeAreaLastBaseline: MisterFusion { return safeArea.lastBaseline }
    
    @available(*, unavailable)
    public var SafeAreaFirstBaseline: MisterFusion { return safeArea.firstBaseline }
    
    @available(*, unavailable)
    public var SafeAreaLeftMargin: MisterFusion { return safeArea.leftMargin }
    
    @available(*, unavailable)
    public var SafeAreaRightMargin: MisterFusion { return safeArea.rightMargin }
    
    @available(*, unavailable)
    public var SafeAreaTopMargin: MisterFusion { return safeArea.topMargin }
    
    @available(*, unavailable)
    public var SafeAreaBottomMargin: MisterFusion { return safeArea.bottomMargin }
    
    @available(*, unavailable)
    public var SafeAreaLeadingMargin: MisterFusion { return safeArea.leadingMargin }
    
    @available(*, unavailable)
    public var SafeAreaTrailingMargin: MisterFusion { return safeArea.trailingMargin }
    
    @available(*, unavailable)
    public var SafeAreaCenterXWithinMargins: MisterFusion { return safeArea.centerXWithinMargins }
    
    @available(*, unavailable)
    public var SafeAreaCenterYWithinMargins: MisterFusion { return safeArea.centerYWithinMargins }
}
