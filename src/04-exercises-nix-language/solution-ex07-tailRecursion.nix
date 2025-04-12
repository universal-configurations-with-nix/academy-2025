let
  # Праввим това за удобство и леснота на четене/писане
  inherit (builtins) length head tail;

  genAttrset = attrset: list:
    if length list < 2 then
      attrset
    else
      genAttrset (attrset // { ${head list} = head (tail list); }) (tail (tail list));
in
  genAttrset { }
