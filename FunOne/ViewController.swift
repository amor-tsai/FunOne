//
//  ViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/7.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    lazy var tableViewModel = {
       return TableViewModel.sharedInstance()
    }()
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if  let dataDict = self.tableViewModel.getDataDictionary(){
           print(dataDict)
           
           self.ImageView.sd_setImage(with: URL(string: "https://serebii.net/pokearth/sprites/gold/101.png"), placeholderImage: UIImage(named: "#101.png"))

        }
        
        
    }


    

    
}

