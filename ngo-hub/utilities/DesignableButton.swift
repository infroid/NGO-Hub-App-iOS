
import UIKit

@IBDesignable class DesignableButton: UIButton {
    @IBInspectable var borderWidth: CGFloat = 0.0 {
    didSet {
         self.layer.borderWidth = borderWidth
    }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var ShadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = ShadowColor.cgColor
        }
    }
    @IBInspectable var ShadowOffSet: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            self.layer.shadowOffset = ShadowOffSet
        }
    }
    @IBInspectable var ShadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = ShadowRadius
        }
    }
    @IBInspectable var shadowOpacity : Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    
}
