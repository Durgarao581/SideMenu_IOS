//
//  HomeViewConViewController.swift
//  Sidemenu
//
//  Created by Durga on 28/03/21.
//

import UIKit

class HomeViewConViewController: UIViewController, SideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

       
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.sideMenuItemSelectedAtIndex(-1);
            sender.tag = 0;
            let viewMenuBack : UIView = view.subviews.last!
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            return
        }
        sender.isEnabled = false
        sender.tag = 10
        let menuVC : SideMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        menuVC.modalPresentationStyle = .currentContext
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
        
    func sideMenuItemSelectedAtIndex(_ index: Int32) {
        let _ : UIViewController = self.navigationController!.topViewController!
    }
}
