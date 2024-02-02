import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

struct MessageError: Error, CustomStringConvertible {
    var description: String

    init(_ description: String) {
        self.description = description
    }
}

public struct NiceInitMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        [
            """
            public init(dummy: Bool) {
                self.init(surfaceColor: .white, onSurfaceColor: .white)
            }
            """
        ]
    }
}

@main
struct NiceInitPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        NiceInitMacro.self,
    ]
}
