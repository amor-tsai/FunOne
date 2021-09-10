//
//  CScorllViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/10.
//

import UIKit

class CScorllViewController: UIViewController,UIScrollViewDelegate {


    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var tableModel = {
        return TableModel.sharedInstance()
    }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.tableModel.getImageWithName(name: displayImageName))
//        return UIImageView.init(image: UIImage(named: self.displayImageName))
    }()
    
    var displayImageName = "Raichu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("CScorllViewController")
        // Do any additional setup after loading the view.
        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.5
            self.scrollView.delegate = self
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
