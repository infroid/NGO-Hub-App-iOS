

import UIKit

class RevealViewController: SWRevealViewController, SWRevealViewControllerDelegate, UIGestureRecognizerDelegate {
    
    var width = UIScreen.main.bounds.size.width
    let ratio: CGFloat = 0.2
    var menuWidth: CGFloat?
    var menuIsOpen: Bool = false
    
    var rightWidth: CGFloat? // Size of right view when menu is open
    
    var tapRecognizer: UITapGestureRecognizer?
    
    var coverView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Size of right view when menu is open
        rightWidth = UIScreen.main.bounds.size.width * ratio
        menuWidth = width - rightWidth!
        
        self.delegate = self
        
        toggleAnimationType = .easeOut
        
        rightViewRevealWidth = width
        rightViewRevealOverdraw = 0
        rightViewRevealDisplacement = 0
        
    self.rightViewController.view.addGestureRecognizer(panGestureRecognizer())
        
        // Remove SW target and action
        panGestureRecognizer().removeTarget(nil, action: nil)
        
        // Add ours ones
        panGestureRecognizer().addTarget(self, action: #selector(handlePan(_:)))
        panGestureRecognizer().delegate = self
        
        frontViewPosition = .leftSideMost
        
        coverView = UIView(frame: UIScreen.main.bounds)
        coverView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapRecognizer?.numberOfTouchesRequired = 1
        tapRecognizer?.cancelsTouchesInView = false
        
        coverView?.addGestureRecognizer(tapRecognizer!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        width = size.width
        self.rightViewRevealWidth = rightWidth!
        self.rightViewRevealOverdraw = width - rightWidth!
    }
    
    func openMenu() {
        //print("Open")
        menuIsOpen = true
        self.rightViewRevealWidth = rightWidth!
        self.rightViewRevealOverdraw = width - rightWidth!;
        self.rightViewController.view.addSubview(coverView!)
        self.setFrontViewPosition(.leftSide, animated: true)
    }
    
    func closeMenu() {
        //print("Close")
        menuIsOpen = false
        self.rightViewRevealWidth = width
        self.rightViewRevealOverdraw = 0;
        coverView?.removeFromSuperview()
        self.setFrontViewPosition(.leftSideMost, animated: true)
    }
    
    func reveal(_ sender: AnyObject?) {
        if self.frontViewPosition == .leftSide {
            closeMenu()
        }
        else {
            openMenu()
        }
    }
    
    //MARK: - UIGestureRecognizer actions
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        reveal(self)
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let position = sender.translation(in: rightViewController.view).x
        //print("Position: \(position)")
        let velocity = sender.velocity(in: rightViewController.view).x
        //print("Velocity: \(velocity)")
        
        switch sender.state {
        case .began:
            if velocity >= quickFlickVelocity {
                openMenu()
            }
        case .changed:
            if menuIsOpen {break}
            rightViewRevealWidth = UIScreen.main.bounds.size.width - position
            rightViewRevealOverdraw = width - rightViewRevealWidth;
            setFrontViewPosition(.leftSide, animated: false)
        case .ended:
            if menuIsOpen {break}
            if position < (width - rightWidth!) / 2 {
                closeMenu()
            }
            else {
                openMenu()
            }
        default:
            break
        }
    }
    
    //MARK: - UIGestureRecognizer delegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == tapRecognizer {
            return true
        }
        if gestureRecognizer == panGestureRecognizer() {
            let velocity = panGestureRecognizer().velocity(in: rightViewController.view)
            if velocity.x > 0 {
                return true
            }
        }
        return false
    }
    
    //MARK: - SWRevealViewControllerDelegate
    
    func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
    }
    
    
    func revealController(_ revealController: SWRevealViewController!, didMoveTo position: FrontViewPosition) {
    }
}
