import SwiftUI

enum NavigateType {
    case three
    case four
}

struct MainView: View {
    @State private var isShowThreePersonView = false
    @State private var isShowFourPersonView = false
    
    let gameScreenForEachPlayer: [(String, AnyView)] = [
        ("2인", AnyView(TwoPlayerView())),
        ("3인", AnyView(ThreePlayerView())),
        ("4인", AnyView(FourPlayerView()))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center, spacing: 12) {
                    ForEach(gameScreenForEachPlayer, id: \.0) { option in
                        NavigationLink(destination: option.1) {
                            Text(option.0)
                                .frame(width: 150, height: 80)
                                .foregroundColor(.primary)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.gray, lineWidth: 1)
                                )
                        }
                    }
                }
                Spacer()
                    .frame(height: 170)
            }
            .navigationTitle("인원 선택")
        }
    }
}

#Preview {
    MainView()
}
