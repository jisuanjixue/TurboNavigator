import Turbo
import TurboNavigator
import UIKit
import Strada
import WebKit

let baseURL = URL(string: "http://localhost:3000")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var turboNavigator = TurboNavigator(delegate: self, pathConfiguration: pathConfiguration)
    private lazy var pathConfiguration = PathConfiguration(sources: [
        .server(baseURL.appendingPathComponent("/configurations/ios_v1.json"))
    ])
    
    private func configureStrada() {
           TurboConfig.shared.userAgent += " \(Strada.userAgentSubstring(for: BridgeComponent.allTypes))"

           TurboConfig.shared.makeCustomWebView = { configuration in
               let webView = WKWebView(frame: .zero, configuration: configuration)
               Bridge.initialize(webView)
               return webView
           }
       }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        configureStrada()

        self.window = UIWindow(windowScene: windowScene)
        self.window?.makeKeyAndVisible()

        self.window?.rootViewController = self.turboNavigator.rootViewController
        self.turboNavigator.route(baseURL)
    }
}

extension SceneDelegate: TurboNavigationDelegate {
    func handle(proposal: VisitProposal) -> ProposalResult {
           .acceptCustom(TurboWebViewController(url: proposal.url))
       }
}
