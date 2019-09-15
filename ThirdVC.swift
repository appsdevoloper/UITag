//
//  ThirdVC.swift
//  UITag
//
//  Created by Apple on 14/09/19.
//  Copyright © 2019 appzoo. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let tag = TagModel(tagId: 2, tagName: "DevTeam", tagStoreKey: "c")
        tag.save()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
