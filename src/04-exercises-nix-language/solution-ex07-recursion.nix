let
  # Праввим това за удобство и леснота на четене/писане
  inherit (builtins) length head tail;

  genAttrset = list:
    if length list < 2 then
      { }
    else
      { ${head list} = head (tail list); } // (genAttrset (tail (tail list)));
in
  genAttrset
