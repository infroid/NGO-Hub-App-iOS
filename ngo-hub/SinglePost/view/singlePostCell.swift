//
//  singlePostCell.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 12/10/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class singlePostCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var categoryBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        
        // Initialization code
    }
    
    
    var flowLayout =  UICollectionViewLayout()
    
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        if let flowLayout = collectionView.collectionViewLayout as?  UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView.register(UINib(nibName: "postImageCell", bundle: nil), forCellWithReuseIdentifier: "postImageCell")
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            print("Functionality not available")
        }
        flowLayout = (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)!
        collectionView.isPagingEnabled = true
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
            let size = UIScreen.main.bounds.size.width
            return CGSize(width: size, height: 240)
      
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postImageCell", for: indexPath) as? postImageCell{
        return cell
        }
        return UICollectionViewCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
