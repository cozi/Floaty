//
//  FloatyLabel.swift
//  KCFloatingActionButton-Sample
//
//  Created by Tim Carlson on 11/27/18.
//  Copyright © 2018 kciter. All rights reserved.
//

import UIKit

@objc open class FloatyLabel: UILabel {
  
  public var textInsets = UIEdgeInsets.zero {
    didSet { invalidateIntrinsicContentSize() }
  }
  
  open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    let insetRect = bounds.inset(by: textInsets)
    let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
    let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
    return textRect.inset(by: invertedInsets)
  }
  
  open override func drawText(in rect: CGRect) {
    super.drawText(in: rect.inset(by: textInsets))
  }
}
