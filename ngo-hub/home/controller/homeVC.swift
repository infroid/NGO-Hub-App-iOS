//
//  ViewController.swift
//  ngo-hub
//
//  Created by HIMALAYA  RAJPUT on 07/09/18.
//  Copyright © 2018 infroid. All rights reserved.
//

import UIKit

class homeVC: UIViewController, UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    @IBAction func sideMenuBtn(_ sender: Any) {
        let revealController = self.revealViewController() as! RevealViewController
        revealController.reveal(sender as AnyObject)
    }
    
    //toggle tag dropdown menu
    @IBAction func showtableView(_ sender: Any) {
        
        selectTag.isHidden = !selectTag.isHidden
        tagBackview.isHidden = !tagBackview.isHidden
        
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tagBackview: DesignabelView!
    @IBOutlet weak var selectTag: UITableView!
    @IBOutlet weak var tagLabel: UILabel!
    let tags1 = ["Deforestation","Pollution","Water Pollution","Child Abuse","Child Labour","Flood","Natural Disaster"]
    var tagged : String!
    let imagePicker = UIImagePickerController()
    var imgArr =  [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        selectTag.delegate = self
        selectTag.dataSource = self
        setupCollectionView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        if let flowLayout = collectionView.collectionViewLayout as?  UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "imageCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        collectionView.register(UINib(nibName: "selectImageCell", bundle: nil), forCellWithReuseIdentifier: "selectImageCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return tags1.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 50
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "select") as? selectTagTableViewCell{
                cell.selectTagLabel.text = tags1[indexPath.row]
                return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tagged = tags1[indexPath.row]
        tagLabel.text = tags1[indexPath.row]
        selectTag.isHidden = true
        tagBackview.isHidden = true
        
    }
    
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width)/3, height: collectionView.bounds.height)
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0{
        return 1
        }
        else{
            return imgArr.count
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectImageCell", for: indexPath) as? selectImageCell{
            return cell
        }
        }
        else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? imageCell{
                let img = imgArr[indexPath.row]
                cell.requestImageView.image = img
                return cell
            }
        }
            return UICollectionViewCell()
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            userImgTapped()
        }
    }
    
   
    @objc func userImgTapped(){
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgArr.append(chosenImage)
        collectionView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    
   


}

