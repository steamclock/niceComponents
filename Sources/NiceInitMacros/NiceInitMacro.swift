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

struct Property {
    var identifier: String
    var type: TypeSyntax
    var hasDefault: Bool
    var attributeDefault: String?
}
public struct NiceInitMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        let memberList = declaration.memberBlock.members

        let properties = memberList.compactMap { member -> Property? in
            // is a property
            guard
                let decl = member.decl.as(VariableDeclSyntax.self),
                let binding = decl.bindings.first,
                let propertyName = binding.pattern.as(IdentifierPatternSyntax.self)?.identifier.text,
                let propertyType = binding.typeAnnotation?.type
            else {
                return nil
            }

            let defaultValue = binding.initializer?.value
            var hasDefault = defaultValue != nil

            var attributeDefault: String? = nil
            for element in decl.attributes {
                if case .attribute(let attribute) = element {
                    if attribute.attributeName.trimmedDescription == "Default" {
                        hasDefault = true
                        let arg = attribute.arguments?.as(LabeledExprListSyntax.self)?.first?.as(LabeledExprSyntax.self)?.expression.as(StringLiteralExprSyntax.self)?.representedLiteralValue

                        attributeDefault = arg
                    }
                }
            }
            return Property(identifier: propertyName, type: propertyType, hasDefault: hasDefault, attributeDefault: attributeDefault)
        }

        var baseInit: String = "public init(\n"
        var first: Bool = true
        for property in properties {
            if !first {
                baseInit += ",\n"
            } else {
                first = false
            }

            if property.hasDefault {
                baseInit += "    \(property.identifier): \(property.type.trimmed)? = nil"
            } else {
                baseInit += "    \(property.identifier): \(property.type.trimmed)"
            }
        }
        baseInit += "\n) {\n"
        for property in properties {
            if property.hasDefault, let attributeDefault = property.attributeDefault {
                baseInit += "self.\(property.identifier) = \(property.identifier) ?? \(attributeDefault)\n"

            } else if property.hasDefault {
                baseInit += "if let _\(property.identifier) = \(property.identifier) { self.\(property.identifier) = _\(property.identifier) }\n"

            } else {
                baseInit += "self.\(property.identifier) = \(property.identifier)\n"
            }
        }
        baseInit += "}"

        return [DeclSyntax(stringLiteral: baseInit)]
    }
}

public struct DefaultMacro: AccessorMacro {
  public static func expansion<
    Context: MacroExpansionContext,
    Declaration: DeclSyntaxProtocol
  >(
    of node: AttributeSyntax,
    providingAccessorsOf declaration: Declaration,
    in context: Context
  ) throws -> [AccessorDeclSyntax] {
    return []
  }
}

@main
struct NiceInitPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        NiceInitMacro.self,
        DefaultMacro.self
    ]
}
