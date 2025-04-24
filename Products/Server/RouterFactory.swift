import Foundation
import Hummingbird
import Logging
import Networking
import OpenAI

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct RouterFactory: Sendable {
    private let client: any OpenAIClient
    init(
        logger: Logger,
        urlLoader: any URLLoader
    ) {
        self.client = OpenAI.client(urlLoader: urlLoader)
    }

    func newRouter() -> Router<BasicRequestContext> {
        let router = Router(context: BasicRequestContext.self)
        router.addMiddleware {
            LogRequestsMiddleware(.info)
        }

        router.get("/") { _, _ in
            return "Hello, world!"
        }

        router.post("/generate") { request, context in
            let generateRequest = try await request.decode(as: GenerateRequest.self, context: context)
            let data = try await client.requestPage(prompt: generateRequest.prompt)
            return Response(
                status: .ok,
                headers: [
                    .contentType: "image/png",
                ],
                body: ResponseBody(data: data)
            )
        }

        return router
    }
}
