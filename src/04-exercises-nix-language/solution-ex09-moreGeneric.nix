programsAttrset:
  let
    programsGrouped = builtins.groupBy
      (x: x.name)
      (builtins.attrValues programsAttrset);

    programsVersions = builtins.mapAttrs
      (name: value: builtins.catAttrs "version" value)
      programsGrouped;

    _findValue = startAcc: pred: list:
      builtins.foldl'
        (acc: x: if pred acc x then x else acc)
        startAcc
        list;

    max = _findValue 0 (acc: x: x > acc);
    min = _findValue (-1) (acc: x: acc == -1 || x < acc);

    _findProgramsByVersion = versionChoser: builtins.attrValues
        (builtins.mapAttrs
          (name: versions: { inherit name; value = versionChoser versions; })
          programsVersions);
  in
    {
      latest = _findProgramsByVersion max;
      oldest = _findProgramsByVersion min;
    }
