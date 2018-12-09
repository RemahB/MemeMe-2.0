//
//  memeTableViewController.swift
//  MemeMe
//
//  Created by Remah on 01/12/2018.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class memeTableViewController: UITableViewController {
    
    
   
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationItem.leftBarButtonItem?.isEnabled = memes.count > 0
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    
    }
    
    
    
    
    
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell", for: indexPath as IndexPath) as! MemeTableViewCell
        let meme = memes[indexPath.row]
        cell.label.text = meme.topText
        cell.memeImage.image = meme.memedImage
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    
    @IBAction func AddMeme(_ sender: UIBarButtonItem) {
        let memeEditor = storyboard?.instantiateViewController(withIdentifier: "addMeme" ) as! ViewController
        present(memeEditor, animated: true, completion: nil)
    }
 
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let memeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "collectionDetailsSegue") as! memePreviewViewController
    memeDetailViewController.meme = memes[(indexPath as NSIndexPath).row]
    navigationController!.pushViewController(memeDetailViewController, animated: true)
    }


    
    }

