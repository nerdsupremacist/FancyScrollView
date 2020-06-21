import SwiftUI

struct BackButton: View {
    let color: Color

    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State private var hasBeenShownAtLeastOnce: Bool = false

    var body: some View {
        (presentationMode.wrappedValue.isPresented || hasBeenShownAtLeastOnce) ?
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
               Image(systemName: "chevron.left")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(height: 20, alignment: .leading)
                   .foregroundColor(color)
                   .padding(.horizontal, 16)
                   .font(Font.body.bold())
            }
            .onAppear {
                self.hasBeenShownAtLeastOnce = true
            }
        : nil
    }
}
