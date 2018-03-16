//
//  DataSingleton.swift
//  DataStructuresApp
//
//  Created by Ethan Chan on 2018-03-15.
//  Copyright © 2018 Waddah Aldrobi. All rights reserved.
//
import UIKit
import Foundation

class DataSingleton{
    
    static let shared = DataSingleton()
    
    var lessonIdentifier = 42
    var sublessonIdentifier = 42
    var data: [Any] = []
    init(){
        print("initialized")
        // MARK: JSON Parsing
        let path = Bundle.main.path(forResource: "JSONData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            guard let lessonDataArray = json as? [Any] else { print("error444"); return }
            
            //watch this for more info on JSON https://www.youtube.com/watch?v=ih20QtEVCa0
            // for info on allowed characters in json: https://stackoverflow.com/questions/2392766/multiline-strings-in-json
        
            self.data = lessonDataArray
            
        } catch {
            print(error)
        }
    }
    
    func grabSpecific(tab: String) -> Any{
        let lessonIdentifier = DataSingleton.shared.lessonIdentifier
        let subLessonIdentifier = DataSingleton.shared.sublessonIdentifier
        let subLessonData = DataSingleton.shared.data[lessonIdentifier] as? [Any]
        let subLessonData2 = subLessonData![subLessonIdentifier] as? [String : Any]
        let subLessonData3 = subLessonData2![tab]
        return(subLessonData3)!
    }

}