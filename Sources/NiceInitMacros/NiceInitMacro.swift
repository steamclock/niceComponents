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
        let memberList = declaration.memberBlock.members

        let properties = memberList.compactMap { member -> (String, TypeSyntax)? in
            // is a property
            guard
                let binding = member.decl.as(VariableDeclSyntax.self)?.bindings.first,
                let propertyName = binding.pattern.as(IdentifierPatternSyntax.self)?.identifier.text,
                let propertyType = binding.typeAnnotation?.type
            else {
                return nil
            }

            return (propertyName, propertyType)
        }

        var baseInit: String = "public init(\n"
        var first: Bool = true
        for property in properties {
            if !first {
                baseInit += ",\n"
            } else {
                first = false
            }
            
            baseInit += "    \(property.0): \(property.1)"
        }
        baseInit += "\n) {\n"
        for property in properties {
            baseInit += "    self.\(property.0) = \(property.0)"
        }
        baseInit += "}"

        return [DeclSyntax(stringLiteral: baseInit)]
    }
}

@main
struct NiceInitPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        NiceInitMacro.self,
    ]
}
