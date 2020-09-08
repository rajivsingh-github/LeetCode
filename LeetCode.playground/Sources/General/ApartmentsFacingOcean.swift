import Foundation

/*
 Given an array representing apartment heights, find all the apartments facing the ocean.
 Input = [4, 3, 2, 3, 1] <===> Ocean
 Here, only 4, 3(index 3, not 1) and 1 apartments can see the ocean
*/

// COMPANIES: Facebook

struct OceanView {
    static func apartmentsFacingOcean(_ arr: [Int]) -> [Int] {
        var oceanViewApartments = [Int]()
        var maxApartmentHeightSoFar = Int.min
        
        for (index, height) in arr.enumerated().reversed() {
            if height > maxApartmentHeightSoFar {
                oceanViewApartments.append(index)
                maxApartmentHeightSoFar = height
            }
        }
        
        return oceanViewApartments
    }
}
