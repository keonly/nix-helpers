{lib, ...}: {
  listFilesNonRecursive = path:
    path
    |> builtins.readDir
    |> lib.mapAttrsToList (name: _:
      path + "/${name}");
}
