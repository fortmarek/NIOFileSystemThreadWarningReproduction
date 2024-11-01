import SwiftUI
import NIOFileSystem

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
            .onAppear() {
                Task {
                    let handle = try await NIOFileSystem.FileSystem.shared.openFile(forReadingAt: .init("/Users/marekfort/Downloads/devices.json"), options: .init())
                    try await handle.close()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
