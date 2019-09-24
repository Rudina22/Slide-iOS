//
//  UIAlertController+Extensions.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 7/24/18.
//  Copyright © 2018 Haptic Apps. All rights reserved.
//

import SDCAlertView
import UIKit

private var associationKey: UInt8 = 0

public extension AlertController {
    private var alertWindow: UIWindow! {
        get {
            return objc_getAssociatedObject(self, &associationKey) as? UIWindow
        }

        set(newValue) {
            objc_setAssociatedObject(self, &associationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    func showWindowless() {
        self.alertWindow = UIWindow.init(frame: UIScreen.main.bounds)
        self.alertWindow.backgroundColor = .red

        let viewController = UIViewController()
        viewController.view.backgroundColor = .green
        self.alertWindow.rootViewController = viewController

        let topWindow = UIApplication.shared.windows.last
        if let topWindow = topWindow {
            self.alertWindow.windowLevel = topWindow.windowLevel + 1
        }

        self.alertWindow.makeKeyAndVisible()
        self.alertWindow.rootViewController?.present(self, animated: true, completion: nil)
    }
}

public extension UIAlertController {
    private var alertWindow: UIWindow! {
        get {
            return objc_getAssociatedObject(self, &associationKey) as? UIWindow
        }

        set(newValue) {
            objc_setAssociatedObject(self, &associationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }

    func showWindowless() {
        self.alertWindow = UIWindow.init(frame: UIScreen.main.bounds)
        self.alertWindow.backgroundColor = .red

        let viewController = UIViewController()
        viewController.view.backgroundColor = .green
        self.alertWindow.rootViewController = viewController

        let topWindow = UIApplication.shared.windows.last
        if let topWindow = topWindow {
            self.alertWindow.windowLevel = topWindow.windowLevel + 1
        }

        self.alertWindow.makeKeyAndVisible()
        self.alertWindow.rootViewController?.present(self, animated: true, completion: nil)
    }
}
public extension UIActivityViewController {
    func showWindowless() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}
