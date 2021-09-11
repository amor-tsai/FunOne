//
//  TableModel.swift
//  FunOne
//
//  Created by Amor on 2021/9/10.
//

import UIKit

class TableModel: NSObject {
    private var dataDictionary: [[String:Any]]? = []
    private let dataName = "Pokemon"
    private var welComeImageURL = {
        return Bundle.main.object(forInfoDictionaryKey: "welcomImageURL") as? String
    }()
    private static let singleInstance: TableModel = {
       let shared = TableModel()
       return shared
    }()
    
    class func sharedInstance() -> TableModel {
        return singleInstance
    }
    
    override init() {
        super.init()
        self.dataDictionary = self.getData(dataName:self.dataName)
    }
    
    private func getData(dataName:String) -> [[String: Any]]? {
        var data: [[String: Any]]?
        if let dataPlistPath = Bundle.main.url(forResource: dataName, withExtension: "plist") {
            do {
                let dataPlistPath = try Data(contentsOf: dataPlistPath)
                
                if let dict = try PropertyListSerialization.propertyList(from: dataPlistPath, options: [], format: nil) as? [[String: Any]] {
                    data = dict
                }
            } catch {
                print(error)
            }
        }
        return data
    }
    
    func getDataDictionary() -> [[String:Any]]? {
        return self.dataDictionary
    }
    
    func numberOfItems() -> Int {
        return self.dataDictionary?.count ?? 0
    }
    
    func getNameWithIndex(index:Int) -> String {
        if let name = self.dataDictionary?[index]["Name"] as? String {
            return name
        }
        return ""
    }
    
    func getImageNameWithName(name:String) -> String {
        var imageName = ""
        for item in self.dataDictionary! {
            if item["Name"] as! String == name,
               let icon = item["Icon"] as? String {
                imageName = icon
                break
            }
        }
        return imageName
    }
    
    func getImageWithName(name:String) ->UIImage? {
        for item in self.dataDictionary! {
            if item["Name"] as! String == name,
               let icon = item["Icon"] as? String{
                return UIImage(named: icon)
            }
        }
        return nil
    }
    
    func getImageWithID(id:String) ->UIImage? {
        for item in self.dataDictionary! {
            if item["ID"] as! String == id,
               let icon = item["Icon"] as? String{
                return UIImage(named: icon)
            }
        }
        return nil
    }
    
    func getImageWithIndex(index:Int) -> UIImage? {
        if let icon = self.dataDictionary?[index]["Icon"] as? String{
            return UIImage(named: icon)
        }
        return nil
    }
    
    func getWelcomeImageURL() -> String?{
        return self.welComeImageURL
    }
    
}
