import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    @State private var rotationAngle: Double = 0.0
    let isLoading: Bool
    
    init(isLoading: Bool = false) {
        self.isLoading = isLoading
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .trailing) {
            configuration.label
                .font(.roboto(size: 16, .medium))
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 44)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundColor(.white)
            
            if isLoading {
                HStack(spacing: 0) {
                    Image(.loader)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: rotationAngle))
                        .onAppear {
                            startRotation()
                        }
                        .onDisappear {
                            stopRotation()
                        }
                    
                    VStack { }
                        .frame(width: 16)
                }
            }
        }
    }
    
    private func startRotation() {
        withAnimation(
            Animation.linear(duration: 0.6).repeatForever(autoreverses: false)
        ) {
            rotationAngle = 360
        }
    }
    
    private func stopRotation() {
        rotationAngle = 0
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {

    /// A button style that highlights primary actions and shows a loader when
    /// `isLoading` is true.
    @MainActor static func primary(isLoading: Bool) -> PrimaryButtonStyle {
        PrimaryButtonStyle(isLoading: isLoading)
    }
    
    @MainActor static var primary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}
