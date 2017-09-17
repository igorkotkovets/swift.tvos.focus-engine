//
//  CircleViewController.swift
//  tvos-swift-focus-engine
//
//  Created by Igor Kotkovets on 9/17/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var list: [UIFocusEnvironment]!

    var nextFocusedButton: UIButton?
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        guard let button = nextFocusedButton else {
            return []
        }
        return [button]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        list = [button1, button2, button3, button4]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        switch sender {
        case button1:
            nextFocusedButton = button2
        case button2:
            nextFocusedButton = button3
        case button3:
            nextFocusedButton = button4
        case button4:
            nextFocusedButton = button1
        default:
            nextFocusedButton = nil
        }

        setNeedsFocusUpdate()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
