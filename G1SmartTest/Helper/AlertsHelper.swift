//
//  AlertHelper.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

typealias Alerts = AlertsHelper
class AlertsHelper {
    
    private static var root: UIViewController? {
        return UIWindow.getWindow()?.visibleViewController
    }
    private static var tintColor: UIColor? {
        return UIColor.themeColor()
    }
    
    static func alert(title:String?,message:String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        alert.view.tintColor = tintColor
        root?.present(alert, animated: true, completion: nil)
    }
    
    static func alertWithComplition(_ title: String, message:String,okBtnTitle: String = "OK",success:@escaping (_ value:Bool)->Void){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: okBtnTitle, style: UIAlertAction.Style.default, handler: { (act) in
            success(true)
        }))
        alertView.view.tintColor = tintColor
        root?.present(alertView, animated: true, completion: nil)
    }
    
    static func alertWithComplitionBoldBtn(_ title: String, message:String,btnOkTitle: String = "Ok", success:@escaping (_ value:Bool)->Void){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: btnOkTitle, style: UIAlertAction.Style.cancel, handler: { (act) in
            success(true)
        }))
        alertView.view.tintColor = tintColor
        root?.present(alertView, animated: true, completion: nil)
    }
    
    static func alertWithComplitionAndCancel(_ title: String, message:String, btnOkTitle: String = "Ok", btnCancelTitle: String = "Cancel",success:@escaping (_ value:Bool)->Void){
        var alertView = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        }
        
        alertView.addAction(UIAlertAction(title: btnCancelTitle, style: UIAlertAction.Style.cancel, handler: { (act) in
            success(false)
        }))
        alertView.addAction(UIAlertAction(title: btnOkTitle, style: UIAlertAction.Style.default, handler: { (act) in
            success(true)
        }))
        alertView.view.tintColor = tintColor
        root?.present(alertView, animated: true, completion: nil)
    }
      
    
}

 
