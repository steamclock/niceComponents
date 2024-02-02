@attached(member, names: named(init))
public macro NiceInit() = #externalMacro(module: "NiceInitMacros", type: "NiceInitMacro")

@attached(accessor, names: named(willSet))
public macro Default(_ stringLiteral: String) =
  #externalMacro(module: "ObservationMacros", type: "ObservationIgnoredMacro")
