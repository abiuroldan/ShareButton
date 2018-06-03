//
//  ViewController.swift
//  shareButton
//
//  Created by Abiu Roldán on 4/1/18.
//  Copyright © 2018 abiuisairamirezroldan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Sharing app"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(handleShare))
        
    }
    
    //Even with custom button just call the method inside the boutlet action
    
    @objc func handleShare(){
        let text = "This is the share text demo"
        let url:URL = URL(string: "https://www.google.com")!
        guard let image = UIImage(named: "IMG_5599") else {return}
        
        let vc = UIActivityViewController(activityItems: [text, url, image], applicationActivities: [])
        vc.excludedActivityTypes = [UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.print, UIActivityType.addToReadingList]
        
        if let popOverController = vc.popoverPresentationController{
            popOverController.sourceView = self.view
            popOverController.sourceRect = self.view.bounds
        }
        
        present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

