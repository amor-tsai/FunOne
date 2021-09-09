//
//  ViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/7.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.TextView.text = "Hello!"
        
        print(TableViewModel.sharedInstance())
    }


    

    
}

