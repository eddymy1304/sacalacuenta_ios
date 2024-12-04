//
//  Dimens.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 2/12/24.
//

import Foundation

struct Dimens {
    
    struct Padding {
        static let small: CGFloat = 4.0
        static let normal: CGFloat = 8.0
        static let medium: CGFloat = 12.0
        static let large: CGFloat = 16.0
        static let extraLarge: CGFloat = 32.00
    }
    
    struct Radius {
        static let small: CGFloat = 4.0
        static let normal: CGFloat = 8.0
        static let medium: CGFloat = 12.0
        static let large: CGFloat = 16.0
        static let extraLarge: CGFloat = 32.00
    }
    
}

extension CGFloat {
    
    static let paddingSmall: CGFloat = Dimens.Padding.small
    static let paddingNormal: CGFloat = Dimens.Padding.normal
    static let paddingMedium: CGFloat = Dimens.Padding.medium
    static let paddingLarge: CGFloat = Dimens.Padding.large
    static let paddingExtraLarge: CGFloat = Dimens.Padding.extraLarge
    
    
    static let radiusSmall: CGFloat = Dimens.Radius.small
    static let radiusNormal: CGFloat = Dimens.Radius.normal
    static let radiusMedium: CGFloat = Dimens.Radius.medium
    static let radiusLarge: CGFloat = Dimens.Radius.large
    static let radiusExtraLarge: CGFloat = Dimens.Radius.extraLarge
    
    static let focusedBorderWidth: CGFloat = 2.0
    static let unfocusedBorderWidth: CGFloat = 1.0
    
}
