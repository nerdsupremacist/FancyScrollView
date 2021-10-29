import SwiftUI

public struct FancyScrollView: View {
    let title: String
    let titleColor: Color
    let headerHeight: CGFloat
    let scrollUpHeaderBehavior: ScrollUpHeaderBehavior
    let scrollDownHeaderBehavior: ScrollDownHeaderBehavior
    let header: AnyView?
    let content: AnyView

    public var body: some View {
        if let header = header {
            return AnyView(
                HeaderScrollView(title: title, titleColor: titleColor,
                                 headerHeight: headerHeight,
                                 scrollUpBehavior: scrollUpHeaderBehavior,
                                 scrollDownBehavior: scrollDownHeaderBehavior,
                                 header: header,
                                 content: content)
            )
        } else {
            return AnyView(
                AppleMusicStyleScrollView {
                    VStack {
                        title != "" ? HStack {
                            Text(title)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .padding(.horizontal, 16)
                                .fixedSize(horizontal: false, vertical: true)

                            Spacer()
                        } : nil

                        title != "" ? Spacer() : nil

                        content
                    }
                }
            )
        }
    }
}

extension FancyScrollView {

    public init<A: View, B: View>(title: String = "", titleColor: Color = Color.white,
                                  headerHeight: CGFloat = 300,
                                  scrollUpHeaderBehavior: ScrollUpHeaderBehavior = .parallax,
                                  scrollDownHeaderBehavior: ScrollDownHeaderBehavior = .offset,
                                  header: () -> A?,
                                  content: () -> B) {

        self.init(title: title, titleColor: titleColor,
                  headerHeight: headerHeight,
                  scrollUpHeaderBehavior: scrollUpHeaderBehavior,
                  scrollDownHeaderBehavior: scrollDownHeaderBehavior,
                  header: AnyView(header()),
                  content: AnyView(content()))
    }

    public init<A: View>(title: String = "", titleColor: Color = Color.white,
                         headerHeight: CGFloat = 300,
                         scrollUpHeaderBehavior: ScrollUpHeaderBehavior = .parallax,
                         scrollDownHeaderBehavior: ScrollDownHeaderBehavior = .offset,
                         content: () -> A) {

           self.init(title: title, titleColor: titleColor,
                     headerHeight: headerHeight,
                     scrollUpHeaderBehavior: scrollUpHeaderBehavior,
                     scrollDownHeaderBehavior: scrollDownHeaderBehavior,
                     header: nil,
                     content: AnyView(content()))
       }

}
