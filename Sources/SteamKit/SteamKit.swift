import SwiftUI

public protocol TextView: View {
    var text: String { get }
    var style: TextStyle { get }
}

public struct BodyText: TextView {
    public let text: String
    public let style = Config.current.bodyText

    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(style.color)
            .font(Font.system(size: style.size))
            .lineLimit(nil)
    }
}

public struct ItemTitle: TextView {
    public let text: String
    public let style = Config.current.itemTitle

    public init(_ text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(style.color)
            .font(Font.system(size: style.size))
            .lineLimit(nil)
    }
}
