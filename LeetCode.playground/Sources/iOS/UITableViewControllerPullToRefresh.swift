import Foundation
import UIKit

/*
 Implement Pull to refresh.
 Fetch new items from server and add the rows at top of a Table view.
*/

// COMPANIES: Facebook

typealias FetchItemCompletion = (Result<[String], Error>) -> Void

class MyPullToRefreshTableViewController {
    var tableView: UITableView!
    var items = [String]()
    
    func pullToRefresh() {
        fetchItems { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let newItems):
                strongSelf.items += newItems
                
                var newIndexPaths = [IndexPath]()
                for (index, _) in newItems.enumerated() {
                    let indexpath = IndexPath.init(row: index, section: 0)
                    newIndexPaths.append(indexpath)
                }
                
                strongSelf.tableView.beginUpdates()
                strongSelf.tableView.insertRows(at: newIndexPaths, with: .automatic)
                strongSelf.tableView.endUpdates()
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    private func fetchItems(completion: @escaping FetchItemCompletion) {
        let newItems = ["D", "E", "F"]
        completion(.success(newItems))
    }
}
