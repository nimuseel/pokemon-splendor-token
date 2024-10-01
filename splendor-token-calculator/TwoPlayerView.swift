import SwiftUI

struct TwoPlayerView: View {
    @State private var player1Balls: [BallType] = [
        BallType(imageName: "poke_ball_fill", count: 0),
        BallType(imageName: "great_ball_flll", count: 0),
        BallType(imageName: "ultra_ball_fill", count: 0),
        BallType(imageName: "heal_ball_fill", count: 0),
        BallType(imageName: "quick_ball_fill", count: 0),
        BallType(imageName: "master_ball_fill", count: 0)
    ]
    @State private var totalCount_1 = 0
    @State private var isOverTen_1 = false

    @State private var player2Balls: [BallType] = [
        BallType(imageName: "poke_ball_fill", count: 0),
        BallType(imageName: "great_ball_flll", count: 0),
        BallType(imageName: "ultra_ball_fill", count: 0),
        BallType(imageName: "heal_ball_fill", count: 0),
        BallType(imageName: "quick_ball_fill", count: 0),
        BallType(imageName: "master_ball_fill", count: 0)
    ]
    @State private var totalCount_2 = 0
    @State private var isOverTen_2 = false
    
    let step = 1
    let range = Binding.constant(0...4)
    
    func resetBallCount(_ balls: inout [BallType]) -> Void {
        for index in balls.indices {
            balls[index].resetCount()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    PlayerBallManage(playerBalls: $player1Balls, totalCount: $totalCount_1, isOverTen: $isOverTen_1, selectedPlayer: .constant("Player 1"), itemSpacing: .constant(20), range: range)
                    
                    Divider().padding(.bottom)
                    
                    PlayerBallManage(playerBalls: $player2Balls, totalCount: $totalCount_2, isOverTen: $isOverTen_2, selectedPlayer: .constant("Player 2"), itemSpacing: .constant(20), range: range)
                }
            }
        }
    }
}

#Preview {
    TwoPlayerView()
}
