{lib, ...}: {
  collectImportsList = path:
    path
    |> filesystem.listFilesNonRecursive
    |> lib.lists.filter (p: builtins.baseNameOf p != "default.nix");
}
