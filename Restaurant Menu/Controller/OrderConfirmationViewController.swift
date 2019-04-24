//
//  OrderConfirmationViewController.swift
//  Restaurant Menu
//
//  Created by Fabiola Saga on 4/23/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class OrderConfirmationViewController: UIViewController {

    
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    var minutes: Int!
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeRemainingLabel.text = "Thank you for your order! your wait time is approximately \(minutes!) minutes."
        
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
