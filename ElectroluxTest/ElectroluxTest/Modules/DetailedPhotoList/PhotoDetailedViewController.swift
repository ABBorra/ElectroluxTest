//
//  PhotoDetailedViewController.swift
//  ElectroluxTest
//
//  Created by AB_Borra on 10/30/22.
//

import UIKit

class PhotoDetailedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        rightNavigationItem()
    }

    // MARK: - Setup NavigationItem
    
    func rightNavigationItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
