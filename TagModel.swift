//
//  TagModel.swift
//  UITag
//
//  Created by thanhvu on 9/15/19.
//  Copyright © 2019 appzoo. All rights reserved.
//

import UIKit

class TagModel {
    var tagId: Int = 0
    var tagName: String = ""
    var tagStoreKey: String = "'"
    
    func dictValue() -> [String:Any] {
        return ["tagId": tagId, "tagName": tagName, "tagStoreKey": tagStoreKey]
    }
    
    init(dict: [String:Any]) {
        self.tagId = dict["tagId"] as! Int
        self.tagName = dict["tagName"] as! String
        self.tagStoreKey = dict["tagStoreKey"] as! String
    }
    
    init(tagId: Int, tagName: String, tagStoreKey: String) {
        self.tagId = tagId
        self.tagName = tagName
        self.tagStoreKey = tagStoreKey
    }
    
    func save() {
        UserDefaults.standard.set(self.dictValue(), forKey: tagStoreKey)
    }
}


extension TagModel: Equatable {
    static func == (lhs: TagModel, rhs: TagModel) -> Bool {
        return lhs.tagId == rhs.tagId
    }
}
