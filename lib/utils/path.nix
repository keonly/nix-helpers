{lib, ...}: {
  relativeToRoot = lib.path.append ../../.;

  collectImports = dir: let
    dirPath =
      if builtins.typeOf dir == "path"
      then dir
      else if builtins.isString dir
      then
        if lib.strings.hasPrefix "/" dir
        then builtins.path {path = dir;}
        else throw "collectImports: Relative string paths are not supported; use a path literal or absolute path."
      else throw "collectImports: Expected a path or string, got ${builtins.typeOf dir}: ${dir}";
  in
    dirPath
    |> builtins.readDir
    |> lib.attrsets.filterAttrs (name: _type:
      _type
      == "directory"
      || (name != "default.nix" && lib.strings.hasSuffix ".nix" name))
    |> builtins.attrNames
    |> builtins.map (n: dirPath + "/${n}");
}
