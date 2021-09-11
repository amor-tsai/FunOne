//
//  ViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/7.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableModel = {
       return TableModel.sharedInstance()
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
        
        
        print(tableModel.numberOfItems())
        print(tableModel.getNameWithIndex(index: 1))
        print(tableModel.getImageNameWithName(name: "Raichu"))
           
//           self.ImageView.sd_setImage(with: URL(string: "https://serebii.net/pokearth/sprites/gold/101.png"), placeholderImage: UIImage(named: "#101.png"))//to be replaced
            
            
        }
        
    func welcomeLableShow() {
        //WelcomeLable
        self.WelcomeLable.text = "Hello, welcome to this weird app!"
        self.WelcomeLable.textAlignment = .center
    }
    
    func welComeButtonShow() {
        //WelcomeButton
        self.WelcomeButton.setTitle("Info", for: .normal)
        self.WelcomeButton.backgroundColor = .clear
        self.WelcomeButton.layer.borderWidth = 1
        self.WelcomeButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    func gzcButtonShow() {
        self.GzcButton.setTitle("Watch Them", for: .normal)
        self.GzcButton.backgroundColor = .clear
        self.GzcButton.layer.borderColor = UIColor.blue.cgColor
        self.GzcButton.layer.borderWidth = 1
    }

    

    
}

