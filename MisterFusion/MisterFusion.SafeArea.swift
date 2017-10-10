//
//  MisterFusion.SafeArea.swift
//  MisterFusion
//
//  Created by marty-suzuki on 2017/10/10.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

import UIKit

public struct SafeAreaExtension {
    let base: UIView
    init(_ base: UIView) {
        self.base = base
    }
}

extension UIView {
    public var safeArea: SafeAreaExtension {
        return SafeAreaExtension(self)
    }
}

extension SafeAreaExtension: MisterFusionConvertible {
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
        let item: LayoutObject
        if #available(iOS 11, *) {
            item = base.safeAreaLayoutGuide
        } else {
            item = base
        }
        return MisterFusion(item: item, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: nil)
    }
}

extension UIView {
    @available(*, unavailable)
    @objc public var SafeAreaTop: MisterFusion { return safeArea.top }
    
    @available(*, unavailable)
    @objc public var SafeAreaRight: MisterFusion { return safeArea.right }
    
    @available(*, unavailable)
    @objc public var SafeAreaLeft: MisterFusion { return safeArea.left }
    
    @available(*, unavailable)
    @objc public var SafeAreaBottom: MisterFusion { return safeArea.bottom }
    
    @available(*, unavailable)
    @objc public var SafeAreaHeight: MisterFusion { return safeArea.height }
    
    @available(*, unavailable)
    @objc public var SafeAreaWidth: MisterFusion { return safeArea.width }
    
    @available(*, unavailable)
    @objc public var SafeAreaLeading: MisterFusion { return safeArea.leading }
    
    @available(*, unavailable)
    @objc public var SafeAreaTrailing: MisterFusion { return safeArea.trailing }
    
    @available(*, unavailable)
    @objc public var SafeAreaCenterX: MisterFusion { return safeArea.centerX }
    
    @available(*, unavailable)
    @objc public var SafeAreaCenterY: MisterFusion { return safeArea.centerY }
    
    @available(*, unavailable)
    @objc public var SafeAreaNotAnAttribute: MisterFusion { return safeArea.notAnAttribute }
    
    @available(*, unavailable)
    @objc public var SafeAreaLastBaseline: MisterFusion { return safeArea.lastBaseline }
    
    @available(*, unavailable)
    @objc public var SafeAreaFirstBaseline: MisterFusion { return safeArea.firstBaseline }
    
    @available(*, unavailable)
    @objc public var SafeAreaLeftMargin: MisterFusion { return safeArea.leftMargin }
    
    @available(*, unavailable)
    @objc public var SafeAreaRightMargin: MisterFusion { return safeArea.rightMargin }
    
    @available(*, unavailable)
    @objc public var SafeAreaTopMargin: MisterFusion { return safeArea.topMargin }
    
    @available(*, unavailable)
    @objc public var SafeAreaBottomMargin: MisterFusion { return safeArea.bottomMargin }
    
    @available(*, unavailable)
    @objc public var SafeAreaLeadingMargin: MisterFusion { return safeArea.leadingMargin }
    
    @available(*, unavailable)
    @objc public var SafeAreaTrailingMargin: MisterFusion { return safeArea.trailingMargin }
    
    @available(*, unavailable)
    @objc public var SafeAreaCenterXWithinMargins: MisterFusion { return safeArea.centerXWithinMargins }
    
    @available(*, unavailable)
    @objc public var SafeAreaCenterYWithinMargins: MisterFusion { return safeArea.centerYWithinMargins }
}
