//
//  ViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit
var tab1arr = ["Single Pointers" , "Linked Lists vs Arrays"]
var tab2arr = ["Double Pointer" , "Singly Linked List/ Doubly Linked Lists"]
var tab3arr = ["Memory Management" , "Circulaurly Linked Lists"]

// Add more buttons, if one has more than the other
// Then, set in the array string to "", and use the isEnabled function
// and set it to false

class SubLessons: UIViewController {
    
    @IBOutlet weak var tab1: UIButton!
    @IBOutlet weak var tab2: UIButton!
    @IBOutlet weak var tab3: UIButton!
    @IBOutlet weak var quizButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
//        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back(_:)))
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SubLessons.back(sender:)))
        
        
//        UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: Selector(SubLessons.back(<#T##SubLessons#>)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        // Makes the text of back button "Back" for the NEXT VC
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    
        // These will change the buttons
        tab1.setTitle(tab1arr[DataSingleton.shared.lessonIdentifier], for: .normal)
        tab1.layer.cornerRadius = 5
        tab2.setTitle(tab2arr[DataSingleton.shared.lessonIdentifier], for: .normal)
        tab2.layer.cornerRadius = 5
        tab3.setTitle(tab3arr[DataSingleton.shared.lessonIdentifier], for: .normal)
        tab3.layer.cornerRadius = 5
        quizButton.layer.cornerRadius = 5
        //tab3.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
//        _ = navigationController?.popViewController(animated: true)
        _ = navigationController?.popToRootViewController(animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "firstTabSegue") {
            DataSingleton.shared.sublessonIdentifier = 0
        } else if (segue.identifier == "secondTabSegue") {
            DataSingleton.shared.sublessonIdentifier = 1
        } else if (segue.identifier == "thirdTabSegue") {
            DataSingleton.shared.sublessonIdentifier = 2
        } else if (segue.identifier == "quizSegue") {
            DataSingleton.shared.sublessonIdentifier = 3
        }
    }
    
    // Controls orientation 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
}
