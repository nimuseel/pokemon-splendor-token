import SwiftUI

struct MainView: View {
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    NavigationLink(destination: TwoPlayerView()) {
                        Text("2인")
                            .frame(width: 150, height: 80)
                            .foregroundColor(.primary)
                            .overlay(
                              RoundedRectangle(cornerRadius: 12)
                                .stroke(.gray, lineWidth:1)
                            )
                    }
                    
                    Button("3인 이상") {
                        showAlert = true
                    }
                        .frame(width: 150, height: 80)
                        .foregroundColor(.primary)
                        .overlay(
                          RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray, lineWidth:1)
                        )
                        .alert("3인 이상 규칙은 열심히 개발 중입니다! 조금만 기다려 주세요!", isPresented: $showAlert) {
                            Button("OK", role: .cancel) {
                                showAlert = false
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
