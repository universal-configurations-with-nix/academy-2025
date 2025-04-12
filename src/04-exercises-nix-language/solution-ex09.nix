programsAttrset:
  let
    programsGrouped = builtins.groupBy
      (x: x.name)
      (builtins.attrValues programsAttrset);

    programsVersions = builtins.mapAttrs
      (name: value: builtins.catAttrs "version" value)
      programsGrouped;

    max = list:
      builtins.foldl'
        (acc: x: if x > acc then x else acc)
        0
        list;

    min = list:
      builtins.foldl'
        (acc: x: if acc == -1 || x < acc then x else acc)
        (-1)
        list;
  in
    {
      latest = builtins.attrValues
        (builtins.mapAttrs
          (name: versions: { inherit name; value = max versions; })
          programsVersions);

      oldest = builtins.attrValues
        (builtins.mapAttrs
          (name: versions: { inherit name; value = min versions; })
          programsVersions);
    }
