import SwiftUI

@main
struct GrandpaClawApp: App {
    @State private var statusText = "Grandpa Claw is watching..."
    
    var body: some Scene {
        MenuBarExtra {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("🦀").font(.system(size: 24))
                    VStack(alignment: .leading) {
                        Text("Grandpa Claw").font(.headline)
                        Text(statusText).font(.caption).foregroundColor(.secondary)
                    }
                }
                Divider()
                Button("Ask Grandpa (WWGCD)") {
                    NSWorkspace.shared.open(URL(string: "https://grandpaclaw.com/wwgcd")!)
                }
                Button("View Archive") {
                    NSWorkspace.shared.open(URL(string: "https://grandpaclaw.com/archive")!)
                }
                Button("Join Waitlist") {
                    NSWorkspace.shared.open(URL(string: "https://grandpaclaw.com/mac")!)
                }
                Divider()
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }
            }
            .padding()
            .frame(width: 240)
        } label: {
            Text("🦀")
        }
        .onAppear { fetchStatus() }
    }
    
    func fetchStatus() {
        guard let url = URL(string: "https://grandpaclaw.com/api/status") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let content = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    statusText = content.isEmpty ? "Online" : content
                }
            }
        }.resume()
    }
}
