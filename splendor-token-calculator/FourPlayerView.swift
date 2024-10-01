import SwiftUI

struct FourPlayerView: View {
    @State var selectedPlayer = "Player 1"
    let players = ["Player 1", "Player 2", "Player 3", "Player 4"]
    
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
    
    @State private var player3Balls: [BallType] = [
        BallType(imageName: "poke_ball_fill", count: 0),
        BallType(imageName: "great_ball_flll", count: 0),
        BallType(imageName: "ultra_ball_fill", count: 0),
        BallType(imageName: "heal_ball_fill", count: 0),
        BallType(imageName: "quick_ball_fill", count: 0),
        BallType(imageName: "master_ball_fill", count: 0)
    ]
    @State private var totalCount_3 = 0
    @State private var isOverTen_3 = false
    
    @State private var player4Balls: [BallType] = [
        BallType(imageName: "poke_ball_fill", count: 0),
        BallType(imageName: "great_ball_flll", count: 0),
        BallType(imageName: "ultra_ball_fill", count: 0),
        BallType(imageName: "heal_ball_fill", count: 0),
        BallType(imageName: "quick_ball_fill", count: 0),
        BallType(imageName: "master_ball_fill", count: 0)
    ]
    @State private var totalCount_4 = 0
    @State private var isOverTen_4 = false
    
    let range = Binding.constant(0...5)
    
    var body: some View {
        VStack(spacing: 40) {
            Picker("플레이어 선택", selection: $selectedPlayer) {
                ForEach(players, id: \.self) { player in
                    Text(player)
                }
            }
            .pickerStyle(.segmented)
            
            switch selectedPlayer {
            case "Player 1":
                PlayerBallManage(playerBalls: $player1Balls, totalCount: $totalCount_1, isOverTen: $isOverTen_1, selectedPlayer: $selectedPlayer, itemSpacing: .constant(40), range: range)
            case "Player 2":
                PlayerBallManage(playerBalls: $player2Balls, totalCount: $totalCount_2, isOverTen: $isOverTen_2, selectedPlayer: $selectedPlayer, itemSpacing: .constant(40), range: range)
            case "Player 3":
                PlayerBallManage(playerBalls: $player3Balls, totalCount: $totalCount_3, isOverTen: $isOverTen_3, selectedPlayer: $selectedPlayer, itemSpacing: .constant(40), range: range)
            case "Player 4":
                PlayerBallManage(playerBalls: $player4Balls, totalCount: $totalCount_4, isOverTen: $isOverTen_4, selectedPlayer: $selectedPlayer, itemSpacing: .constant(40), range: range)
            default:
                EmptyView()
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    FourPlayerView()
}
