//
//  MisterFusion.SafeArea.swift
//  MisterFusion
//
//  Created by marty-suzuki on 2017/10/10.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - UIView

public struct UIViewSafeArea {
    let base: View
    init(_ base: View) {
        self.base = base
    }
}

extension View {
    public var safeArea: UIViewSafeArea {
        return UIViewSafeArea(self)
    }
}

extension UIViewSafeArea: MisterFusionConvertible {
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
    
    private func createMisterFusion(with attribute: Attribute) -> MisterFusion {
        let item: _LayoutObject
        if #available(iOS 11, tvOS 11, *) {
            item = base.safeAreaLayoutGuide
        } else {
            item = base
        }
        return MisterFusion(item: item, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: nil)
    }
}

extension View {
    @objc public var SafeAreaTop: MisterFusion { return safeArea.top }

    @objc public var SafeAreaRight: MisterFusion { return safeArea.right }

    @objc public var SafeAreaLeft: MisterFusion { return safeArea.left }

    @objc public var SafeAreaBottom: MisterFusion { return safeArea.bottom }

    @objc public var SafeAreaHeight: MisterFusion { return safeArea.height }

    @objc public var SafeAreaWidth: MisterFusion { return safeArea.width }

    @objc public var SafeAreaLeading: MisterFusion { return safeArea.leading }

    @objc public var SafeAreaTrailing: MisterFusion { return safeArea.trailing }

    @objc public var SafeAreaCenterX: MisterFusion { return safeArea.centerX }

    @objc public var SafeAreaCenterY: MisterFusion { return safeArea.centerY }

    @objc public var SafeAreaNotAnAttribute: MisterFusion { return safeArea.notAnAttribute }

    @objc public var SafeAreaLastBaseline: MisterFusion { return safeArea.lastBaseline }

    @objc public var SafeAreaFirstBaseline: MisterFusion { return safeArea.firstBaseline }

    @objc public var SafeAreaLeftMargin: MisterFusion { return safeArea.leftMargin }

    @objc public var SafeAreaRightMargin: MisterFusion { return safeArea.rightMargin }

    @objc public var SafeAreaTopMargin: MisterFusion { return safeArea.topMargin }

    @objc public var SafeAreaBottomMargin: MisterFusion { return safeArea.bottomMargin }

    @objc public var SafeAreaLeadingMargin: MisterFusion { return safeArea.leadingMargin }

    @objc public var SafeAreaTrailingMargin: MisterFusion { return safeArea.trailingMargin }

    @objc public var SafeAreaCenterXWithinMargins: MisterFusion { return safeArea.centerXWithinMargins }
    
    @objc public var SafeAreaCenterYWithinMargins: MisterFusion { return safeArea.centerYWithinMargins }
}

// MARK: - UIViewController

public struct UIViewControllerSafeArea {
    let base: UIViewController
    init(_ base: UIViewController) {
        self.base = base
    }
}

extension UIViewController {
    public var safeArea: UIViewControllerSafeArea {
        return UIViewControllerSafeArea(self)
    }
}

extension UIViewControllerSafeArea {
    class _LayoutGuideProxy: _LayoutObject {
        let rawValue: Any

        init(_ layoutGuide: UILayoutSupport) {
            self.rawValue = layoutGuide
        }
    }

    public var top: MisterFusion {
        let item: _LayoutObject
        let attribute: Attribute
        if #available(iOS 11, tvOS 11, *) {
            item = base.view.safeAreaLayoutGuide
            attribute = .top
        } else {
            item = _LayoutGuideProxy(base.topLayoutGuide)
            attribute = .bottom
        }
        return createMisterFusion(with: item, and: attribute)
    }

    public var bottom: MisterFusion {
        let item: _LayoutObject
        let attribute: Attribute
        if #available(iOS 11, tvOS 11, *) {
            item = base.view.safeAreaLayoutGuide
            attribute = .bottom
        } else {
            item = _LayoutGuideProxy(base.bottomLayoutGuide)
            attribute = .top
        }
        return createMisterFusion(with: item, and: attribute)
    }

    private func createMisterFusion(with item: _LayoutObject, and attribute: Attribute) -> MisterFusion {
        return MisterFusion(item: item, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: nil)
    }
}

extension UIViewController {
    @objc public var SafeAreaTop: MisterFusion { return safeArea.top }

    @objc public var SafeAreaBottom: MisterFusion { return safeArea.bottom }
}
#endif
