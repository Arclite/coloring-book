import Foundation
import Hummingbird

extension ResponseBody {
    init(data: Data) {
        let allocator = ByteBufferAllocator()
        var buffer = allocator.buffer(capacity: data.count)
        buffer.writeBytes(data)
        self.init(byteBuffer: buffer)
    }
}
