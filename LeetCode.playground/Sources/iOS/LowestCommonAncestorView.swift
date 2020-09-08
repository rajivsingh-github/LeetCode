import Foundation
import UIKit

// COMPANIES: Facebook

class LowestCommonAncestorView {
    static func lowestCommonAncestor(of v1: UIView?, and v2: UIView?) -> UIView? {
        var candidates = Set<UIView>.init()
        
        var curr = v1
        while let view = curr {
            candidates.insert(view)
            curr = view.superview
        }
        
        curr = v2
        while let view = curr {
            if candidates.contains(view) {
                return view
            }
            curr = view.superview
        }
        
        return nil
    }
}
