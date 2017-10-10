//
//  MisterFusionConvertible.swift
//  MisterFusion
//
//  Created by marty-suzuki on 2017/10/11.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

import Foundation

public protocol MisterFusionConvertible {
    var top: MisterFusion { get }
    var right: MisterFusion { get }
    var left: MisterFusion { get }
    var bottom: MisterFusion { get }
    var height: MisterFusion { get }
    var width: MisterFusion { get }
    var leading: MisterFusion { get }
    var trailing: MisterFusion { get }
    var centerX: MisterFusion { get }
    var centerY: MisterFusion { get }
    var notAnAttribute: MisterFusion { get }
    var lastBaseline: MisterFusion { get }
    var firstBaseline: MisterFusion { get }
    var leftMargin: MisterFusion { get }
    var rightMargin: MisterFusion { get }
    var topMargin: MisterFusion { get }
    var bottomMargin: MisterFusion { get }
    var leadingMargin: MisterFusion { get }
    var trailingMargin: MisterFusion { get }
    var centerXWithinMargins: MisterFusion { get }
    var centerYWithinMargins: MisterFusion { get }
}
