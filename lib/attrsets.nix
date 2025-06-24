{lib, ...}: {
  /*
  mergeAttrsListRecursive :: [ AttrSet ] -> AttrSet
  Recursively combines a list of attribute sets:
    - For scalar keys, the value that appears *last* in the list wins
      (same semantics as `lib.recursiveUpdate`).
    - For nested attrsets, the merge continues at deeper levels.

  Example
  -------
    mergeAttrsListRecursive [
      { a = 1; foo = { x = 10; }; }
      { b = 2; foo = { y = 20; }; }
      { a = 99; }
    ]
    == { a = 99; b = 2; foo = { x = 10; y = 20; }; }
  */
  mergeAttrsListRecursive = attrSets: (
    lib.foldl' lib.recursiveUpdate {} attrSets
  );
}
