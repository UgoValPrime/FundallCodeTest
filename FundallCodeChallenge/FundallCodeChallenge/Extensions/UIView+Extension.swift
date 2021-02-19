//
//  UIView+Extension.swift
//  FundallCodeChallenge
//
//  Created by Ugo Val on 2/18/21.
//

import Foundation
import UIKit

extension UIView {
    
    func addBackgroundImage(image: String) {
          // screen width and height:
          let width = UIScreen.main.bounds.size.width
          let height = UIScreen.main.bounds.size.height
          
          let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
          imageViewBackground.image = UIImage(named: image)
          
          // you can change the content mode:
          imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
          
          self.addSubview(imageViewBackground)
          self.sendSubviewToBack(imageViewBackground)
       }
}


extension String {
    var isValidEmail: Bool {
          NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
       }
}

extension UIViewController {
    
    func presentAlertForError(with prompt: String) {
          let alert = UIAlertController(title: "⚠️", message: prompt, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
          self.present(alert, animated: true, completion: nil)
       }
}
