//
//  HappFont.swift
//  happ
//
//  Created by Alexey Ageev on 17.07.2023.
//

import SwiftUI

public struct HappFont {
    private static let regular = "Montserrat-Regular"
    private static let semibold = "Montserrat-SemiBold"

    internal static let logo: Font = .custom(semibold, size: 64)
    public static let largeTitle: Font = .custom(regular, size: 34, relativeTo: .largeTitle)
    public static let title: Font = .custom(semibold, size: 28, relativeTo: .title)
    public static let title2: Font = .custom(regular, size: 22, relativeTo: .title2)
    public static let title3: Font = .custom(regular, size: 20, relativeTo: .title3)
    public static let headline: Font = .custom(semibold, size: 17, relativeTo: .headline)
    public static let subheadline: Font = .custom(regular, size: 15, relativeTo: .subheadline)
    public static let body: Font = .custom(regular, size: 17, relativeTo: .body)
    public static let callout: Font = .custom(regular, size: 16, relativeTo: .callout)
    public static let caption: Font = .custom(regular, size: 12, relativeTo: .caption)
    public static let caption2: Font = .custom(regular, size: 11, relativeTo: .caption2)
    public static let footnote: Font = .custom(regular, size: 13, relativeTo: .footnote)
}
