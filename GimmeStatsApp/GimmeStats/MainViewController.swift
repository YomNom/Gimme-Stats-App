//
//  MainViewController.swift
//  GimmeStats
//
//  Created by Joey Yong on 4/4/23.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel?.text = "Click the button…"
    }

    @IBAction func onButtonTap(sender: UIButton) {
        textLabel?.text = "Hello world!"
    }
}

