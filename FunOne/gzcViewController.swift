//
//  gzcViewController.swift
//  FunOne
//
//  Created by Zicheng Geng on 9/10/21.
//

import UIKit
let tm = TableModel()
let dict = tm.getDataDictionary()
class gzcViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var choosePokemonPicker: UIPickerView?
    @IBOutlet weak var valueLbl: UILabel?
    @IBOutlet weak var valueLbl1: UILabel?
    @IBOutlet weak var valueLbl2: UILabel?
    @IBOutlet weak var valueLbl3: UILabel?
    @IBOutlet weak var stepper: UIStepper?
    @IBOutlet weak var stepper1: UIStepper?
    @IBOutlet weak var stepper2: UIStepper?
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var ATK: UILabel!
    @IBOutlet weak var DEF: UILabel!
    @IBOutlet weak var SPD: UILabel!
    @IBOutlet weak var HP: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (pokemons[row] as! String)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pokemonName?.text = (pokemons[row] as! String)
        pokemonImage?.image = tm.getImageWithName(name: pokemons[row] as! String)
        valueLbl?.text = "\(dict![row]["ATT"]!)" as String
        stepper?.value = dict![row]["ATT"]! as! Double
        valueLbl1?.text = "\(dict![row]["DEF"]!)" as String
        stepper1?.value = dict![row]["DEF"]! as! Double
        valueLbl2?.text = "\(dict![row]["Speed"]!)" as String
        stepper2?.value = dict![row]["Speed"]! as! Double
        valueLbl3?.text = "\(dict![row]["HP"]!)" as String
        slider?.value = dict![row]["HP"]! as! Float
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.pokemonImage
    }
    
    @IBOutlet weak var pokemonImage: UIImageView?
    @IBOutlet weak var pokemonName: UILabel?
    
    var pokemons = [] as NSMutableArray
    

    
    @IBAction func slider(_ sender: UISlider) {
        valueLbl3?.text = String(Int(sender.value))
    }
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var status: UILabel!
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            status.text = "Carrying with you"
        }
        else{
            status.text = "Left at garage"
        }
    }

    
    override func viewDidLoad() {
        for element in dict!{
            pokemons.add(element["Name"]!)
        }
        print(dict![1]["ATT"]!)
        print(type(of: dict![1]["ATT"]!))
        
        super.viewDidLoad()
        choosePokemonPicker?.delegate = self
        choosePokemonPicker?.dataSource = self
        pokemonName?.text = "empty"
        valueLbl?.text = "0"
        valueLbl1?.text = "0"
        valueLbl2?.text = "0"
        valueLbl3?.text = "0"
        stepper?.autorepeat = true
        stepper?.isContinuous = true
        ATK.text = "ATT:"
        DEF.text = "DEF:"
        SPD.text = "SPD:"
        HP.text = "HP:"
        stepper?.maximumValue = 100
        stepper?.minimumValue = 0
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 2.0
        
        pokemonName?.text = (pokemons[0] as! String)
        pokemonImage?.image = tm.getImageWithName(name: pokemons[0] as! String)
        valueLbl?.text = "\(dict![0]["ATT"]!)" as String
        stepper?.value = dict![0]["ATT"]! as! Double
        valueLbl1?.text = "\(dict![0]["DEF"]!)" as String
        stepper1?.value = dict![0]["DEF"]! as! Double
        valueLbl2?.text = "\(dict![0]["Speed"]!)" as String
        stepper2?.value = dict![0]["Speed"]! as! Double
        valueLbl3?.text = "\(dict![0]["HP"]!)" as String
        slider?.value = dict![0]["HP"]! as! Float
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        valueLbl?.text = sender.value.description
    }
    @IBAction func stepperValueChanged1(_ sender: UIStepper) {
        valueLbl1?.text = sender.value.description
    }
    @IBAction func stepperValueChanged2(_ sender: UIStepper) {
        valueLbl2?.text = sender.value.description
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
