import SwiftUI

struct AppleMusicStyleScrollView: View {
    let content: AnyView

    @State
    private var offset: CGFloat = 0

    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    GeometryReader { geometry -> Text in
                        let offset = geometry.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = offset
                        }
                        return Text("")
                    }
                    content
                        .animation(nil)
                }
            }
            GeometryReader { geometry in
                BlurView()
                    .opacity(self.offset >= 0 ? 0 : 1)
                    .frame(width: geometry.size.width,
                           height: geometry.safeAreaInsets.top)
                    .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top / 2)
                    .edgesIgnoringSafeArea(.top)
                    .animation(.spring())
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


extension AppleMusicStyleScrollView {

    init<Content: View>(content: () -> Content) {
        self.init(content: AnyView(content()))
    }

}
