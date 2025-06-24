{lib, ...}: {
  relativeToRoot = lib.path.append ../../.;
  collectImports = path:
    path
    |> builtins.readDir
    |> lib.attrsets.filterAttrs (name: _type:
      _type
      == "directory"
      || (name != "default.nix" && lib.strings.hasSuffix ".nix" name))
    |> builtins.attrNames
    |> builtins.map (name: "${path}/${name}");
}
