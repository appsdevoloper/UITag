//
//  FifthVC.swift
//  UITag
//
//  Created by Apple on 14/09/19.
//  Copyright © 2019 appzoo. All rights reserved.
//

import UIKit

class FifthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let tag = TagModel(tagId: 4, tagName: "C", tagStoreKey: "e")
        tag.save()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
