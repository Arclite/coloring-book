import Logging
import Networking

@main
struct ColoringBook {
    private static let shared: ColoringBook = ColoringBook()
    
    private let server: Server

    init(
        logger: Logger,
        urlLoader: any URLLoader
    ) {
        self.server = Server(
            logger: logger,
            urlLoader: urlLoader
        )
    }

    init() {
        var logger = Logger(label: "ColoringBook")
        logger.logLevel = .debug

        self.init(
            logger: logger,
            urlLoader: Networking.urlLoader
        )
    }

    static func main() async throws {
        try await shared.server.run()
    }
}
