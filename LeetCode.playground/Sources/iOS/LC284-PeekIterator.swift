import Foundation

/*
 Given an Iterator class interface with methods: next() and hasNext(), design and implement a PeekingIterator that support the peek() operation -- it essentially peek() at the element that will be returned by the next call to next().

 Example:

 Assume that the iterator is initialized to the beginning of the list: [1,2,3].

 Call next() gets you 1, the first element in the list.
 Now you call peek() and it returns 2, the next element. Calling next() after that still return 2.
 You call next() the final time and it returns 3, the last element.
 Calling hasNext() after that should return false.
 Follow up: How would you extend your design to be generic and work with all types, not just integer?
*/

// COMPANIES: Apple - 8, Facebook - 4, eBAY - 3, Google - 2

protocol PeekingIteratorProtocol: IteratorProtocol {
    func peek() -> Element?
}

struct PeekingIterator<T: Collection>: PeekingIteratorProtocol {
    private let collection: T
    private var currentIndex: T.Index
    
    init(collection: T) {
        self.collection = collection
        self.currentIndex = collection.startIndex
    }
    
    mutating func next() -> T.Element? {
        guard collection.isEmpty == false, currentIndex < collection.endIndex else { return nil }
        
        let element = collection[currentIndex]
        collection.formIndex(after: &currentIndex)
        
        return element
    }
    
    func peek() -> T.Element? {
        guard collection.isEmpty == false, currentIndex < collection.endIndex else { return nil }
        
        let element = collection[currentIndex]
        return element
    }
    
    func allObjects() -> T.SubSequence? {
        guard collection.isEmpty == false, currentIndex < collection.endIndex else { return nil }
        
        let allObjects = collection[currentIndex..<collection.endIndex]
        return allObjects
    }
}

extension Array {
    func makePeekIterator() -> PeekingIterator<Array> {
        return PeekingIterator(collection: self)
    }
}
