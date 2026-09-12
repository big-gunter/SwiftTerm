// Hand-written replacement for what `SwiftTermBuildInfoPlugin` (removed on
// this fork -- see the fork's own README/branch notes) would otherwise
// generate at build time. That plugin is an SPM build-tool plugin, which
// Xcode refuses to run without a one-time manual "Trust & Enable" click in
// its own GUI, breaking any headless/CI build outright. This fork exists
// specifically to pull in upstream scrollback/rendering fixes without that
// requirement, so the generated-file mechanism is replaced with this static
// stand-in instead of removed outright (`Terminal.swift`'s XTVERSION
// response reads `SwiftTermBuildInfo.tag`/`.branch`/`.version` directly).
//
// Mirrors the exact shape `BuildInfoGenerator.sourceFile(...)` produces,
// with values fixed to this fork's own identity rather than computed from
// `git` at build time.
#if !SWIFTTERM_EMBEDDED
/// Source-control information for this SwiftTerm build.
public enum SwiftTermBuildInfo {
    public static let branch: String? = "scrollback-fixes-no-buildinfo-plugin"
    public static let tag: String? = nil
    public static let commit: String? = "a7b8b943e854d1073b3b79ec5cd802e4873e3df0"
    public static let hasUncommittedChanges: Bool? = false
    public static let version: String = "a7b8b943e854-fork"
}
// `SwiftTermTerminfo` (the other type this plugin generated) lives in
// `GeneratedTerminfo.swift` instead -- a real captured table, not a stub,
// since unlike this file's git-metadata values it was cheap to preserve in
// full. See that file's own doc comment.
#endif
