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
        
        print("this is a dictionary: \(self.getData() as AnyObject)")
        
    }

    func getData() -> [[String: Any]]? {
        var data: [[String: Any]]?
        if let resourcePlistPath = Bundle.main.url(forResource: "Pokemon", withExtension: "plist") {
            do {
                let resourcePlistPath = try Data(contentsOf: resourcePlistPath)
//                if let dict : NSDictionary = NSDictionary(contentsOf: infoPlistPath){
                if let dict = try PropertyListSerialization.propertyList(from: resourcePlistPath, options: [], format: nil) as? [[String: Any]] {
                    data = dict
                }
            } catch {
                print(error)
            }
        }
        return data
        
    }
    

    
}

