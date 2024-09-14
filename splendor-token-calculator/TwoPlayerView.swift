import SwiftUI

struct BallType: Identifiable, Equatable {
    let id = UUID()
    var imageName: String
    var count: Int
    
    mutating func resetCount() {
        self.count = 0
    }
}

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
    let range = 0...4
    
    func resetBallCount(_ balls: inout [BallType]) -> Void {
        for index in balls.indices {
            balls[index].resetCount()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Text("Player 1")
                            Text("토큰 수: \(totalCount_1)")
                                .foregroundStyle(isOverTen_1 ? Color.red : .primary)
                            Button("초기화") {
                                resetBallCount(&player1Balls)
                            }
                        }
                        ForEach($player1Balls) { $ball in
                            HStack {
                                Stepper(
                                    value: $ball.count,
                                    in: range,
                                    step: step
                                ) {
                                    Image(ball.imageName)
                                }
                                .padding(.trailing, 60)
                                .disabled(isOverTen_1 && ball.count <= 0)
                                
                                Text("\(ball.count)")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .onChange(of: player1Balls, {
                        totalCount_1 = player1Balls.reduce(0) { $0 + $1.count }
                        isOverTen_1 = totalCount_1 >= 10
                    })
                    
                    Spacer()
                    Divider().padding(.bottom)
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Text("Player 2")
                            Text("토큰 수: \(totalCount_2)")
                                .foregroundStyle(isOverTen_2 ? Color.red : .primary)
                            Button("초기화") {
                                resetBallCount(&player2Balls)
                            }
                        }
                        ForEach($player2Balls) { $ball in
                            HStack {
                                Stepper(
                                    value: $ball.count,
                                    in: range,
                                    step: step
                                ) {
                                    Image(ball.imageName)
                                }
                                .padding(.trailing, 60)
                                .disabled(isOverTen_2 && ball.count <= 0)
                                
                                Text("\(ball.count)")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .onChange(of: player2Balls, {
                        totalCount_2 = player2Balls.reduce(0) { $0 + $1.count }
                        isOverTen_2 = totalCount_2 >= 10
                    })
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TwoPlayerView()
}
