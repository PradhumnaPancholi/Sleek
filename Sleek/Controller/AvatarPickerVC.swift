//
//  AvatarPickerVC.swift
//  Sleek
//
//  Created by user148657 on 3/3/19.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //to load number of cells/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    //to load data in cells//
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item)
            return cell
        }
        return AvatarCell()
    }
    
    //function to select/save the choosen avatar//\
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDataServices.instance.setAvatarName(avatarName : "avatar\(indexPath.item)")
        
        dismiss(animated: true, completion: nil)
    }  
    
    //to dismiss segue/VC//
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
