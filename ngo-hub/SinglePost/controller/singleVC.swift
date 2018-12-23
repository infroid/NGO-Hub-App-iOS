//
//  singleVC.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 20/10/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class singleVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBAction func sideMenuBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
     var post : recent?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = post?.title
        descLabel.text = post?.description
        setupCollectionView()
        // Do any additional setup after loading the view.
    }

    var flowLayout =  UICollectionViewLayout()
    //setup collection view layout 
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
        
        let size = self.collectionView.frame
        return CGSize(width: size.width, height: size.height)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
