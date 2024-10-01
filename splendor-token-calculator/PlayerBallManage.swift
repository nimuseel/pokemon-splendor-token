import SwiftUI

struct PlayerBallManage: View {
    @Binding var playerBalls: [BallType];
    @Binding var totalCount: Int
    @Binding var isOverTen: Bool
    @Binding var selectedPlayer: String
    @Binding var itemSpacing: CGFloat
    @Binding var range: ClosedRange<Int>
    
    let step = 1
    
    func resetBallCount(_ balls: inout [BallType]) -> Void {
        for index in balls.indices {
            balls[index].resetCount()
        }
    }
    
    
    var body: some View {
        VStack(spacing: itemSpacing) {
            HStack(spacing: 20) {
                Text("\(selectedPlayer)")
                Text("토큰 수: \(totalCount)")
                    .foregroundStyle(isOverTen ? Color.red : .primary)
                Button("초기화") {
                    resetBallCount(&playerBalls)
                }
            }
            ForEach($playerBalls) { $ball in
                HStack {
                    Stepper(
                        value: $ball.count,
                        in: range,
                        step: step
                    ) {
                        Image(ball.imageName)
                    }
                    .padding(.trailing, 60)
                    .disabled(isOverTen && ball.count <= 0)
                    
                    Text("\(ball.count)")
                }
                .padding(.horizontal)
            }
        }
        .onChange(of: playerBalls, {
            totalCount = playerBalls.reduce(0) { $0 + $1.count }
            isOverTen = totalCount >= 10
        })
        
    }
}

#Preview {
    PlayerBallManage(playerBalls: .constant([BallType(imageName: "poke_ball_fill", count: 0)]), totalCount: .constant(1), isOverTen: .constant(false), selectedPlayer: .constant("Player 1"), itemSpacing: .constant(20), range: .constant(0...5))
}
