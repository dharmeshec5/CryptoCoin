//
//  StoryboardHelper.swift
//  CryptoCoin
//
//  Created by Dharmesh Patel on 31/03/22.
//

import Foundation
import UIKit

// MARK: - Identifiable

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable where Self: AnyObject {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Identifiable { }
extension UITableViewCell: Identifiable { }

extension UIStoryboard {
    static let main: UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle(for: Request.self))
    
    func created<T: UIViewController>() -> T {
        instantiateViewController(withIdentifier: T.identifier) as! T
    }
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
