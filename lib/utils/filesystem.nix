{lib, ...}: {
  listFilesNonRecursive = dir: let
    entries = builtins.readDir dir;
    names = builtins.attrNames entries;
    dirStr = builtins.toString dir;
  in
    lib.lists.map (
      name: "${dirStr}/${name}"
    )
    names;
}
