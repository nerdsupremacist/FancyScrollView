import SwiftUI

extension View {

    func hackNavigationToAllowSpipeBackWhenHidden() -> some View {
        return background(NavigationConfigurator())
    }

}

private struct NavigationConfigurator: UIViewControllerRepresentable {

    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        return UIViewController()
    }

    func makeCoordinator() -> NavigationConfigurator.Coordinator {
        return Coordinator()
    }

    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {

        uiViewController.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        uiViewController.navigationController?.interactivePopGestureRecognizer?.delegate = context.coordinator
    }

}
