//
//  Animation+Extension.swift
//  G1SmartTest
//
//  Created by Simranjeet Singh on 31/07/22.
//

import UIKit

enum AnimationDirection: String {
    case up
    case down
    case left
    case right
    case none
}

extension UITableView {
     func reloadWithAnimation(animationDirection:AnimationDirection) {
         self.isHidden = false
         self.reloadData()
         guard animationDirection != .none else { return }
         self.layoutIfNeeded()
        let cells = self.visibleCells
        var index = 0
        let tableHeight: CGFloat = self.bounds.size.height
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            switch animationDirection {
            case .up:
                cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                break
            case .down:
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                break
            case .left:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            case .right:
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                break
            default:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            }
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}
extension UICollectionView {
    func reloadWithAnimation(animationDirection:AnimationDirection) {
            self.isHidden = false
        self.reloadData()
            guard animationDirection != .none else { return }
        self.layoutIfNeeded()
           let cells = self.visibleCells
           var index = 0
           let tableHeight: CGFloat = self.bounds.size.height
           for i in cells {
               let cell: UICollectionViewCell = i as UICollectionViewCell
               switch animationDirection {
               case .up:
                   cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                   break
               case .down:
                   cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                   break
               case .left:
                   cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                   break
               case .right:
                   cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                   break
               default:
                   cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                   break
               }
               UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                   cell.transform = CGAffineTransform(translationX: 0, y: 0);
               }, completion: nil)
               index += 1
           }
   }
}

extension UIViewController {
    func pAnimation(animationDirection:AnimationDirection, animateTO: [UIView]) {
         
         guard animationDirection != .none else { return }
        
        let views = animateTO
        var index = 0
        let selfHeight: CGFloat = self.view.bounds.size.height
        for i in views {
            let view: UIView = i as UIView
            
            switch animationDirection {
            case .up:
                view.transform = CGAffineTransform(translationX: 0, y: -selfHeight)
                break
            case .down:
                view.transform = CGAffineTransform(translationX: 0, y: selfHeight)
                break
            case .left:
                view.transform = CGAffineTransform(translationX: selfHeight, y: 0)
                break
            case .right:
                view.transform = CGAffineTransform(translationX: -selfHeight, y: 0)
                break
            default:
                view.transform = CGAffineTransform(translationX: selfHeight, y: 0)
                break
            }
            view.isHidden = false
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                view.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}
