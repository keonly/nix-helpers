{
  lib,
  haumea,
  ...
}: {
  filesystem = import ./filesystem.nix;

  collectImportsList = path:
    path
    |> filesystem.listFilesRecursive
    |> lib.lists.filter (p: builtins.baseNameOf p != "default.nix");

  loadImportsList = args:
    haumea.lib.load {
      inherit (args) src inputs;
    }
    |> builtins.attrValues;
}
