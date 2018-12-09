//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Remah on 01/12/2018.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit



class MemeCollectionViewController: UICollectionViewController {
    var meme = UIImage?.self
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFlowLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        collectionView?.reloadData()
        super.viewWillAppear(true)
    }
    
    func setFlowLayout() {
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath as IndexPath) as! MemeCollectionCell
        let meme = memes[indexPath.row]
        cell.imageView.image = meme.memedImage
           return cell
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    
    @IBAction func AddNewMeme(_ sender: UIBarButtonItem) {
        let memeEditor = storyboard?.instantiateViewController(withIdentifier: "addMeme" ) as! ViewController
        present(memeEditor, animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memePreviewViewController = storyboard?.instantiateViewController(withIdentifier: "collectionDetailsSegue") as! memePreviewViewController
        memePreviewViewController.meme = memes[(indexPath as NSIndexPath).row]
        navigationController!.pushViewController(memePreviewViewController, animated: true)
        
    }
    
}
