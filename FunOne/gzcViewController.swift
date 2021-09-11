//
//  gzcViewController.swift
//  FunOne
//
//  Created by Zicheng Geng on 9/10/21.
//

import UIKit

class gzcViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pokemons[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pokemonName?.text = pokemons[row]
        pokemonImage?.image = UIImage(named: pokemons[row])
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.pokemonImage
    }
    
    @IBOutlet weak var pokemonImage: UIImageView?
    @IBOutlet weak var pokemonName: UILabel?
    
    let pokemons = ["bulbasaur","pikachu"]
    
    @IBOutlet weak var choosePokemonPicker: UIPickerView?
    
    
    @IBOutlet weak var valueLbl: UILabel?
    @IBOutlet weak var valueLbl1: UILabel?
    @IBOutlet weak var valueLbl2: UILabel?
    @IBOutlet weak var valueLbl3: UILabel?
    @IBOutlet weak var stepper: UIStepper?
    @IBOutlet weak var stepper1: UIStepper?
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
        super.viewDidLoad()
        choosePokemonPicker?.delegate = self
        choosePokemonPicker?.dataSource = self
        pokemonImage?.image = UIImage(named: "bird")
        pokemonName?.text = "empty"
        
        stepper?.autorepeat = true
        stepper?.isContinuous = true
        valueLbl?.text = "0"
        valueLbl1?.text = "0"
        valueLbl2?.text = "0"
        valueLbl3?.text = "0"
        stepper?.maximumValue = 100
        stepper?.minimumValue = 0
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 2.0
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
