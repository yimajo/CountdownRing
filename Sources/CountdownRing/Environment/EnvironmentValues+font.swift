//
//  EnvironmentValues+font.swift
//  CirclularProgress
//
//  Created by Yoshinori Imajo on 2020/02/05.
//  Copyright © 2020 Curiosity Software Inc. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct FontColorKey: EnvironmentKey {
    static let defaultValue: Color = .white
}

@available(iOS 13.0, *)
extension EnvironmentValues {
    var fontColor: Color {
        get { self[FontColorKey.self] }
        set { self[FontColorKey.self] = newValue }
    }
}
