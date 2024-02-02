@attached(member, names: named(init), named(with))
public macro NiceInit() = #externalMacro(module: "NiceInitMacros", type: "NiceInitMacro")

@attached(accessor, names: named(willSet))
public macro Default(_ stringLiteral: String) =
  #externalMacro(module: "NiceInitMacros", type: "DefaultMacro")

@attached(accessor, names: named(willSet))
public macro Asset() =
  #externalMacro(module: "NiceInitMacros", type: "AssetMacro")
