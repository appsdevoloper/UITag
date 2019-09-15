//
//  ViewController.swift
//  UITag
//
//  Created by Apple on 14/09/19.
//  Copyright © 2019 appzoo. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagLabel: UILabel!
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "cell"
    var items = [TagModel]()

    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tagValidation()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        let tag = items[indexPath.item]
        cell.tagLabel.text = tag.tagName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
        
        let indexValue = indexPath.item
        let tag = items[indexValue]
        self.removeTag(tag)
        
        print("\(items)")
        self.collectionView.reloadData()
    }
    
    // MARK: - UITag Validation To Add
    
    func tagValidation(){
        
        // Validate A
        if let aValue = UserDefaults.standard.object(forKey: "a") as? [String:Any] {
            let tag = TagModel(dict: aValue)
            if items.contains(tag) == false {
                items.append(tag)
            }
        }
        
        // Validate B
        if let bValue = UserDefaults.standard.object(forKey: "b") as? [String:Any] {
            let tag = TagModel(dict: bValue)
            if items.contains(tag) == false {
                items.append(tag)
            }
        }
        
        // Validate C
        if let cValue = UserDefaults.standard.object(forKey: "c") as? [String:Any] {
            let tag = TagModel(dict: cValue)
            if items.contains(tag) == false {
                items.append(tag)
            }
        }
        
        // Validate D
        if let dValue = UserDefaults.standard.object(forKey: "d") as? [String:Any] {
            let tag = TagModel(dict: dValue)
            if items.contains(tag) == false {
                items.append(tag)
            }
        }
        
        // Validate E
        if let eValue = UserDefaults.standard.object(forKey: "e") as? [String:Any] {
            let tag = TagModel(dict: eValue)
            if items.contains(tag) == false {
                items.append(tag)
            }
        }
        
        // Validate F
        if let fValue = UserDefaults.standard.object(forKey: "f") as? [String:Any] {
            let tag = TagModel(dict: fValue)
            if items.contains(tag) == false {
                items.append(tag)
            }
        }
        
        items.sort { (lhs, rhs) -> Bool in
            return lhs.tagId < rhs.tagId
        }
        self.collectionView.reloadData()
    }
    
    // MARK: - UITag Remove Particular
    
    func removeTag(_ tag: TagModel){
        UserDefaults.standard.removeObject(forKey: tag.tagStoreKey)
        if let tagIndex = self.items.firstIndex(of: tag) {
            self.items.remove(at: tagIndex)
        }
        
        self.collectionView.reloadData()
    }
    
    // MARK: - UITag Remove All
    
    @IBAction func doneAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "a")
        UserDefaults.standard.removeObject(forKey: "b")
        UserDefaults.standard.removeObject(forKey: "c")
        UserDefaults.standard.removeObject(forKey: "d")
        UserDefaults.standard.removeObject(forKey: "e")
        UserDefaults.standard.removeObject(forKey: "f")
        self.items.removeAll()
        self.collectionView.reloadData()
    }
    
    // MARK: - UITag Button Actions for Add

    @IBAction func aAction(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "firstviewcontroller") as! FirstVC
        let navigationVC = UINavigationController(rootViewController: firstVC)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func bAction(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondviewcontroller") as! SecondVC
        let navigationVC = UINavigationController(rootViewController: secondVC)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func cAction(_ sender: Any) {
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "thirdviewcontroller") as! ThirdVC
        let navigationVC = UINavigationController(rootViewController: thirdVC)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func dAction(_ sender: Any) {
        let fourthVC = self.storyboard?.instantiateViewController(withIdentifier: "fourthviewcontroller") as! FourthVC
        let navigationVC = UINavigationController(rootViewController: fourthVC)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func eAction(_ sender: Any) {
        let fifthVC = self.storyboard?.instantiateViewController(withIdentifier: "fifthviewcontroller") as! FifthVC
        let navigationVC = UINavigationController(rootViewController: fifthVC)
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    @IBAction func fAction(_ sender: Any) {
        let sixthVC = self.storyboard?.instantiateViewController(withIdentifier: "sixthviewcontroller") as! SixthVC
        let navigationVC = UINavigationController(rootViewController: sixthVC)
        self.present(navigationVC, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = items[indexPath.row]
        let textWidth = tag.tagName.size(withAttributes:[.font: UIFont.systemFont(ofSize: 9.0)]).width + 11.0 //30.0 is the extra padding
        let width = min(textWidth, 100.0) //100.0 is the max width
        return CGSize(width: width, height: collectionView.bounds.height)
    }
}
