//
//  CMagicViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/10.
//

import UIKit

class CMagicViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    
    var lableText = "This lable can change color!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Label.text = self.lableText
        
        //to change the lable's color
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setLabelRandomBackgroundColor), userInfo: nil, repeats: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func setLabelRandomBackgroundColor() {
        let colors = [
            UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
            UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
            UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
            UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
            UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
        ]
        let randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        self.Label.backgroundColor = colors[randomColor]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
