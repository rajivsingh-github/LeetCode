import Foundation
import UIKit
/*
    Implement dequeueReusableCellsWithIdentifier:indexPath:
*/

class MyTableView {
    var reusableCells = [String: [UITableViewCell]]()
    var registeredCellClass = [String: UITableViewCell.Type]()
    
    func dequeueReusableCellsWithIdentifier(_ identifier: String, indexpath: IndexPath) -> UITableViewCell? {
        if let cells = reusableCells[identifier], cells.isEmpty == false {
            var modifiedCells = cells
            
            let cell = modifiedCells.removeFirst()
            reusableCells[identifier] = modifiedCells
            
            cell.prepareForReuse()
            
            return cell
        }
        
        // Make a new cell
        guard let RegisteredClass = registeredCellClass[identifier] else {
            return nil
        }
        
        let cell = RegisteredClass.init(style: .default, reuseIdentifier: identifier)
        
        return cell
    }
}
