//
//  FixedViewController.swift
//  tvos-swift-focus-engine
//
//  Created by Igor Kotkovets on 9/17/17.
//  Copyright © 2017 Igor Kotkovets. All rights reserved.
//

import UIKit

class FixedViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var bt1_4StackView: UIStackView!
    @IBOutlet weak var bt4_6StackView: UIStackView!
    @IBOutlet weak var bigStackView: UIStackView!

    var focus5_7LeftGuide: UIFocusGuide!
    var focus5_7BottomGuide: UIFocusGuide!
    var focus2_5BottomGuide: UIFocusGuide!
    var focus1_7LeftGuide: UIFocusGuide!

    override func viewDidLoad() {
        super.viewDidLoad()

        focus5_7LeftGuide = UIFocusGuide()
        view.addLayoutGuide(focus5_7LeftGuide)
        focus5_7LeftGuide.bottomAnchor.constraint(equalTo: button7.topAnchor).isActive = true
        focus5_7LeftGuide.rightAnchor.constraint(equalTo: button5.leftAnchor).isActive = true
        focus5_7LeftGuide.leftAnchor.constraint(equalTo: button7.leftAnchor).isActive = true
        focus5_7LeftGuide.topAnchor.constraint(equalTo: button1.topAnchor).isActive = true

        focus5_7BottomGuide = UIFocusGuide()
        view.addLayoutGuide(focus5_7BottomGuide)
        focus5_7BottomGuide.topAnchor.constraint(equalTo: button5.bottomAnchor).isActive = true
        focus5_7BottomGuide.leftAnchor.constraint(equalTo: button7.rightAnchor).isActive = true
        focus5_7BottomGuide.bottomAnchor.constraint(equalTo: button7.bottomAnchor).isActive = true
        focus5_7BottomGuide.rightAnchor.constraint(equalTo: button2.rightAnchor).isActive = true

        focus2_5BottomGuide = UIFocusGuide()
        view.addLayoutGuide(focus2_5BottomGuide)
        focus2_5BottomGuide.topAnchor.constraint(equalTo: button2.bottomAnchor).isActive = true
        focus2_5BottomGuide.bottomAnchor.constraint(equalTo: button5.topAnchor).isActive = true
        focus2_5BottomGuide.rightAnchor.constraint(equalTo: button2.rightAnchor).isActive = true
        focus2_5BottomGuide.leftAnchor.constraint(equalTo: button5.rightAnchor).isActive = true

        focus1_7LeftGuide = UIFocusGuide()
        view.addLayoutGuide(focus1_7LeftGuide)
        focus1_7LeftGuide.topAnchor.constraint(equalTo: button1.topAnchor).isActive = true
        focus1_7LeftGuide.bottomAnchor.constraint(equalTo: button7.bottomAnchor).isActive = true
        focus1_7LeftGuide.rightAnchor.constraint(equalTo: button1.leftAnchor).isActive = true
        focus1_7LeftGuide.leftAnchor.constraint(equalTo: button7.leftAnchor).isActive = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UIFocusEnvironment

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)

        /*
         Update the focus guide's `preferredFocusedView` depending on which
         button has the focus.
         */
        guard let nextFocusedView = context.nextFocusedView else { return }

        switch nextFocusedView {
        case button5:
            focus5_7LeftGuide.preferredFocusEnvironments = [button7]
            focus5_7BottomGuide.preferredFocusEnvironments = [button7]
        case button1:
            focus1_7LeftGuide.preferredFocusEnvironments = [button7]
        case button7:
            focus5_7LeftGuide.preferredFocusEnvironments = [button5]
            focus5_7BottomGuide.preferredFocusEnvironments = [button5]
        case button2:
            focus2_5BottomGuide.preferredFocusEnvironments = [button5]
        default:
            focus5_7LeftGuide.preferredFocusEnvironments = []
            focus5_7BottomGuide.preferredFocusEnvironments = []
            focus2_5BottomGuide.preferredFocusEnvironments = []
        }
    }

}
