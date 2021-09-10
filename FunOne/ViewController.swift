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
    
    @IBOutlet weak var WelcomeLable: UILabel!
    
    @IBOutlet weak var WelcomeButton: UIButton!
    
    @IBOutlet weak var GzcButton: UIButton!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.welcomeLableShow()
        
        self.welComeButtonShow()
        
        self.gzcButtonShow()
        
        
        if  let dataDict = self.tableViewModel.getDataDictionary(){
           print(dataDict)
           
//           self.ImageView.sd_setImage(with: URL(string: "https://serebii.net/pokearth/sprites/gold/101.png"), placeholderImage: UIImage(named: "#101.png"))//to be replaced
            
            
        }
        
        
    }
    
    func welcomeLableShow() {
        //WelcomeLable
        self.WelcomeLable.text = "Hello, welcome to this weird app!"
        self.WelcomeLable.textAlignment = .center
    }
    
    func welComeButtonShow() {
        //WelcomeButton
        self.WelcomeButton.setTitle("Open them!", for: .normal)
        self.WelcomeButton.backgroundColor = .clear
        self.WelcomeButton.layer.borderWidth = 1
        self.WelcomeButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    func gzcButtonShow() {
        self.GzcButton.setTitle("kick off!", for: .normal)
        self.GzcButton.backgroundColor = .clear
        self.GzcButton.layer.borderColor = UIColor.blue.cgColor
        self.GzcButton.layer.borderWidth = 1
    }

    

    
}

