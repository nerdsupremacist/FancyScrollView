
import Foundation
import SwiftUI

extension View {

    func hideNavigationBarWithoutLosingSwipeBack(_ hidden: Bool) -> some View {
        return background(NavigationConfigurator(hidden: hidden))
    }

}

private struct NavigationConfigurator: UIViewControllerRepresentable {
    let hidden: Bool

    class Coordinator: NSObject {
        weak var navigationController: UINavigationController?

        deinit {
            navigationController?.navigationBar.isHidden = false
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

        uiViewController.navigationController?.navigationBar.isHidden = hidden
        context.coordinator.navigationController = uiViewController.navigationController
    }

}
