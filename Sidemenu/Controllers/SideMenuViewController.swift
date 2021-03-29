//
//  SideMenuViewController.swift
//  Sidemenu
//
//  Created by Durga on 28/03/21.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var buttonOverlay: UIButton!
    
    var btnMenu : UIButton!
    var delegate : SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonClicked(_ button: UIButton) {
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if (button == self.buttonOverlay) {
                index = -1
            }
            delegate?.sideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0)
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
   
   

}

protocol SideMenuDelegate {
    func sideMenuItemSelectedAtIndex(_ index : Int32)
}
