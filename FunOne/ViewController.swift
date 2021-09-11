//
//  ViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/7.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    lazy var tableModel = {
       return TableModel.sharedInstance()
    }()
    
    @IBOutlet weak var WelcomeLable: UILabel!
    
    @IBOutlet weak var WelcomeButton: UIButton!
    
    @IBOutlet weak var GzcButton: UIButton!
        
    @IBOutlet weak var WelcomeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.welcomeLableShow()
        
        self.welComeButtonShow()
        
        self.gzcButtonShow()
        
        
        print(tableModel.numberOfItems())
        print(tableModel.getNameWithIndex(index: 1))
        print(tableModel.getImageNameWithName(name: "Raichu"))
        
        self.WelcomeImageView.sd_setImage(with: URL(string: (self.tableModel.getWelcomeImageURL())!), placeholderImage: UIImage(named: self.tableModel.getWelcomeImageURL()!))//
            
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

