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
                        DispatchQueue.main.async {
                            self.offset = geometry.frame(in: .global).minY
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
