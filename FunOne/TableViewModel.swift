//
//  TableViewModel.swift
//  FunOne
//
//  Created by Amor on 2021/9/8.
//

import Foundation

class TableViewModel:NSObject{
    private var dataDictionary: [[String:Any]]? = []
    private let dataName = "Pokemon"
    private static let singleInstance: TableViewModel = {
       let shared = TableViewModel()
       return shared
    }()
    
    class func sharedInstance() -> TableViewModel {
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
        
}
