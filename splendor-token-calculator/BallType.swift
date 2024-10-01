import Foundation

struct BallType: Identifiable, Equatable {
    let id = UUID()
    var imageName: String
    var count: Int
    
    mutating func resetCount() {
        self.count = 0
    }
}
