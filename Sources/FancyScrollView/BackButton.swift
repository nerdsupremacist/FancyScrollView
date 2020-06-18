import SwiftUI

struct BackButton: View {
    let color: Color

    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>

    var body: some View {
        presentationMode.wrappedValue.isPresented ?
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(color)
                    .padding(.horizontal, 16)
                    .font(Font.body.bold())
            } : nil
    }
}
