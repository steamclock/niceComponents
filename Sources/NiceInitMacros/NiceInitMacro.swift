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
    var isOptional: Bool
    var hasDefault: Bool
    var attributeDefault: String?
    var isColorAsset: Bool

    var optType: String {
        return isOptional ? type.description : type.description + "?"
    }
}

public struct NiceInitMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let type = declaration.as(StructDeclSyntax.self)?.name.trimmed.description else {
            throw(MessageError("@NiceInit can only be attached to a struct"))
        }

        // TODO: this should be filtering out computed properties
        let memberList = declaration.memberBlock.members

        guard !memberList.isEmpty else {
            throw(MessageError("@NiceInit can only be attached to a type with some stored properties"))
        }

        // Extract the list of properties to initialize
        let properties = try memberList.compactMap { member -> Property? in
            guard
                let decl = member.decl.as(VariableDeclSyntax.self),
                let binding = decl.bindings.first,
                let propertyName = binding.pattern.as(IdentifierPatternSyntax.self)?.identifier.text
            else {
                return nil
            }

            // TODO: wont work for declarations without explicit type i.e. ("var foo: Foo = Foo()" will work, but "var foo = Foo()" won't
            guard let propertyType = binding.typeAnnotation?.type.trimmed else {
                throw(MessageError("@NiceInit currently only supports properties with explicit type annotations"))
            }

            let defaultValue = binding.initializer?.value
            var hasDefault = defaultValue != nil
            let optional = propertyType.description.last == "?" // TODO: should handle Optional<T> as well
            var isColorAsset = false

            var attributeDefault: String? = nil
            for element in decl.attributes {
                if case .attribute(let attribute) = element {
                    if attribute.attributeName.trimmedDescription == "NiceDefault" {
                        hasDefault = true
                        let arg = attribute.arguments?.as(LabeledExprListSyntax.self)?.first?.as(LabeledExprSyntax.self)?.expression.as(StringLiteralExprSyntax.self)?.representedLiteralValue

                        attributeDefault = arg
                    } else if attribute.attributeName.trimmedDescription == "NiceAsset" {
                        if propertyType.description != "Color" {
                            throw(MessageError("@Asset can only be attached to a property of type Color (\(propertyName))"))
                        }
                        isColorAsset = true
                    }
                }
            }
            return Property(identifier: propertyName, type: propertyType, isOptional: optional, hasDefault: hasDefault, attributeDefault: attributeDefault, isColorAsset: isColorAsset)
        }

        var generated: [DeclSyntax] = []

        // generate the basic memberwise initializer
        do {
            var baseInit: String = "public init(\n"

            baseInit += properties.map {
                if $0.isColorAsset || $0.hasDefault || $0.isOptional {
                   "    \($0.identifier): \($0.optType) = nil"
                } else {
                   "    \($0.identifier): \($0.type)"
                }
            }.joined(separator: ",\n")

            baseInit += "\n) {\n"

            baseInit += properties.map {
                if $0.isColorAsset {
                    "self.\($0.identifier) = \($0.identifier) ?? Color(\"\($0.identifier)\", bundle: Bundle.module)"
                } else if $0.hasDefault, let attributeDefault = $0.attributeDefault {
                    "self.\($0.identifier) = \($0.identifier) ?? \(attributeDefault)\n"
                } else if $0.hasDefault {
                    "if let _\($0.identifier) = \($0.identifier) { self.\($0.identifier) = _\($0.identifier) }\n"
                } else {
                    "self.\($0.identifier) = \($0.identifier)\n"
                }
            }.joined()

            baseInit += "}"
            generated.append(DeclSyntax(stringLiteral: baseInit))
        }

        // generate the copy-and-modify initializer
        do {
            var copyInit: String = "public init(\nwith: \(type)"

            copyInit += properties.map {
                ",\n\($0.identifier): \($0.optType) = nil"
            }.joined()

            copyInit += "\n) {\n"

            copyInit += properties.map {
                "self.\($0.identifier) = \($0.identifier) ?? with.\($0.identifier)\n"
            }.joined()

            copyInit += "}"
            
            generated.append(DeclSyntax(stringLiteral: copyInit))
        }

        // generate the "create from template" with function"
        do {
            var with: String = "public func with(\n"

            with += properties.map {
                "\($0.identifier): \($0.optType) = nil"
            }.joined(separator: ",\n")

            with += "\n) -> \(type) {\n\(type)("

            with += properties.map {
                "\($0.identifier):\($0.identifier) ?? self.\($0.identifier)"
            }.joined(separator: ",\n")

            with += ")\n}"
            generated.append(DeclSyntax(stringLiteral: with))
        }

        return generated
    }
}

// Empty marker macro, doesn't actually generate any syntax, just there so it can be read by the main NiceInitMacro
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

// Empty marker macro, doesn't actually generate any syntax, just there so it can be read by the main NiceInitMacro
public struct AssetMacro: AccessorMacro {
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
        DefaultMacro.self,
        AssetMacro.self
    ]
}
