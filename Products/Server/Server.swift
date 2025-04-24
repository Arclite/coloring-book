import Hummingbird
import Logging
import Networking

struct Server {
    private let logger: Logger
    private let urlLoader: any URLLoader
    init(
        logger: Logger,
        urlLoader: any URLLoader
    ) {
        self.logger = logger
        self.urlLoader = urlLoader
    }

    func run() async throws {
        let router = RouterFactory(
            logger: logger,
            urlLoader: urlLoader
        ).newRouter()

        let app = Application(
            router: router,
            configuration: .init(
                address: .hostname("0.0.0.0", port: 8008),
                serverName: "ColoringBook"
            ),
            logger: logger
        )

        try await app.runService()
    }
}
