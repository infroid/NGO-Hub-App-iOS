import UIKit

@IBDesignable class DesignableTextView: UITextView {
    @IBInspectable var BorderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var CornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = CornerRadius
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
    @IBInspectable var masksToBound : Bool = false {
        didSet {
            self.layer.masksToBounds = masksToBound
        }
    }
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateGradientEffect()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateGradientEffect()
        }
    }
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    
    func updateGradientEffect(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor , secondColor.cgColor]
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
    }
}
