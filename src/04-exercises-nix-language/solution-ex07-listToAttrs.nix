list:
  let
    # Праввим това за удобство и леснота на четене/писане
    inherit (builtins) length head tail;

    convertList = list:
      if length list < 2 then
        [ ]
      else
        [ { name = head list; value = head (tail list); } ] ++ convertList (tail (tail list));
  in
    builtins.listToAttrs (convertList list)
