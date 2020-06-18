import SwiftUI

struct BackButton: View {
    let color: Color

    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>

    var body: some View {
        presentationMode.wrappedValue.isPresented ?
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(color)
                    .padding(.horizontal, 16)
                    .background(Rectangle().opacity(0.0))
                    .font(Font.body.bold())
            } : nil
    }
}
