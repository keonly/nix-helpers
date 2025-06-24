{
  homeManagerBaseModule,
  homeModules ? [],
  specialArgs,
  vars,
}: {
  imports = [homeManagerBaseModule];

  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "home-manager.backup";
    extraSpecialArgs = specialArgs;
    users."${vars.username}".imports = homeModules;
  };
}
