//
//  ViewController.swift
//  KCFloatingActionButton
//
//  Created by LeeSunhyoup on 2015. 10. 4..
//  Copyright © 2015년 kciter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FloatyDelegate {
  
  var floaty = Floaty()
  
  override func viewDidLoad() {
    super.viewDidLoad()
		
    layoutFAB()
  }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		toggleCancelButton.setTitle(toggleCancelButonString(), for: .normal)
	}
  
  @IBAction func endEditing() {
    view.endEditing(true)
  }
  
  @IBAction func customImageSwitched(_ sender: UISwitch) {
    if sender.isOn == true {
      floaty.buttonImage = UIImage(named: "custom-add")
    } else {
      floaty.buttonImage = nil
    }
  }
  
	@IBOutlet weak var toggleCancelButton: UIButton!
	
	@IBAction func toggleCancelButton(_ sender: Any) {
		floaty.hasCancelButton = !floaty.hasCancelButton
		toggleCancelButton.setTitle(toggleCancelButonString(), for: .normal)
	}
	
	func layoutFAB() {
    let item = FloatyItem()
    item.hasShadow = false
    item.buttonColor = UIColor.blue
    item.circleShadowColor = UIColor.red
    item.titleShadowColor = UIColor.blue
    item.titleLabelPosition = .left
    item.title = "custom item"
    item.handler = { item in
 
    }
		
		floaty.plusColor = UIColor.white
		floaty.hasShadow = true
		
    floaty.itemTitleBackgroundColor = UIColor.white
    floaty.itemTitleColor = UIColor.black
		
		floaty.hasCancelButton = false
		
		floaty.addItem("I've got a handler", icon: UIImage(named: "icMap")) { item in
			let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}


		floaty.addItem("Second item", icon: UIImage(named: "icShare"))
    floaty.addItem(title: "Third Item")
//    floaty.addItem("I got a handler", icon: UIImage(named: "icMap")) { item in
//      let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
//      alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
//      self.present(alert, animated: true, completion: nil)
//    }
    floaty.addItem(item: item)
		
//    floaty.paddingX = self.view.frame.width/2 - floaty.frame.width/2
    floaty.fabDelegate = self
		
		floaty.openAnimationType = .pop
		floaty.friendlyTap = false
		
    self.view.addSubview(floaty)
    
  }
  
  // MARK: - Floaty Delegate Methods
  func floatyWillOpen(_ floaty: Floaty) {
    print("Floaty Will Open")
  }
  
  func floatyDidOpen(_ floaty: Floaty) {
    print("Floaty Did Open")
  }
  
  func floatyWillClose(_ floaty: Floaty) {
    print("Floaty Will Close")
  }
  
  func floatyDidClose(_ floaty: Floaty) {
    print("Floaty Did Close")
  }
	
	func emptyFloatySelected(_ floaty: Floaty) {
		print("Empty Floaty Selected")
	}
  
}

// Helpers

extension ViewController {
	func toggleCancelButonString() -> String {
		if floaty.hasCancelButton {
			return "Floaty uses a cancel button"
		} else {
			return "Floaty not using a cancel button"
		}
	}
}
