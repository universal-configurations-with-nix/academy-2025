list:
  let
    # Праввим това за удобство при добре познатите ни функции
    inherit (builtins) head tail;

    flatten = list:
      if list == [ ] then
        [ ]
      else
        (head list) ++ (flatten (tail list));

    values = list: flatten (builtins.catAttrs "names" list);

    unique = result: list:
      if list == [ ] then
        result
      else if builtins.elem (head list) result then
        unique result (tail list)
      else
        unique (result ++ [ (head list) ]) (tail list);
  in
    unique [ ] (values list)
