import SwiftUI

extension View {

    func hackNavigationToAllowSwipeBackWhenHidden() -> some View {
        return background(NavigationConfigurator())
    }

}

private struct NavigationConfigurator: UIViewControllerRepresentable {
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        weak var navigationController: UINavigationController?
        weak var originalDelegate: UIGestureRecognizerDelegate?

        deinit {
            navigationController?.interactivePopGestureRecognizer?.delegate = originalDelegate
        }

        override func forwardingTarget(for aSelector: Selector!) -> Any? {
            return originalDelegate
        }

        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            if let navigationController = navigationController,
                navigationController.isNavigationBarHidden {
                return true
            } else if let result = originalDelegate?.gestureRecognizerShouldBegin?(gestureRecognizer) {
                return result
            } else {
                return false
            }
        }

        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
            if let navigationController = navigationController,
                navigationController.isNavigationBarHidden {
                return true
            } else if let result = originalDelegate?.gestureRecognizer?(gestureRecognizer, shouldReceive: touch) {
                return result
            } else {
                return false
            }
        }
        
        @available(iOS 13.4, *)
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
            if let navigationController = navigationController,
                navigationController.isNavigationBarHidden {
                return true
            } else if let result = originalDelegate?.gestureRecognizer?(gestureRecognizer, shouldReceive: event) {
                return result
            } else {
                return false
            }
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
            if let navigationController = navigationController,
                navigationController.isNavigationBarHidden {
                return true
            } else if let result = originalDelegate?.gestureRecognizer?(gestureRecognizer, shouldReceive: press) {
                return result
            } else {
                return false
            }
        }
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        let controller = UIViewController()
        controller.title = "Some title"
//        controller.navigationItem.
        return controller
    }

    func makeCoordinator() -> NavigationConfigurator.Coordinator {
        return Coordinator()
    }

    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {

        uiViewController.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        guard
            let originalDelegate = uiViewController.navigationController?.interactivePopGestureRecognizer?.delegate,
            !(originalDelegate is Coordinator)
        else {
            return
        }
        context.coordinator.navigationController = uiViewController.navigationController
        context.coordinator.originalDelegate = originalDelegate
        uiViewController.navigationController?.interactivePopGestureRecognizer?.delegate = context.coordinator
    }
}
