//
//  HappLogo.swift
//  happ
//
//  Created by Alexey Ageev on 26.07.2023.
//

import SwiftUI

public struct HappLogo: View {
    public enum Size {
        case short
        case long
    }

    let size: Size

    public init(size: Size) {
        self.size = size
    }

    public var body: some View {
        Text("Happ")
            .font(HappFont.logo)
            .fontWeight(.black)
//        Image(imageName, bundle: .module)
//            .renderingMode(.original)
    }

    private var imageName: String {
        switch size {
        case .short:
            return "Logo short"
        case .long:
            return "Logo full"
        }
    }
}

#if DEBUG
struct HappLogo_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            HappLogo(size: .short)
            HappLogo(size: .long)
        }
        .padding()
        .background(AppTheme.main.background)
        .previewLayout(.sizeThatFits)
    }
}
#endif
