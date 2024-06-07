//
//  HappControlShape.swift
//  happ
//
//  Created by Alexey Ageev on 21.07.2023.
//

import SwiftUI

struct HappControlShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path(roundedRect: rect, cornerRadius: 10, style: .continuous)
    }
}
