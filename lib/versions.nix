{...}: {
  largestVersion = versions:
    builtins.foldl'
    (currentMax: v:
      if builtins.compareVersions currentMax v < 0
      then v
      else currentMax)
    (builtins.head versions)
    (builtins.tail versions);

  versionAtLeast = a: b: builtins.compareVersions a b >= 0;
}
