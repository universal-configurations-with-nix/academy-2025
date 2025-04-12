list:
  let
    inherit (builtins) head tail;

    values = list:
      if list == [ ] then
        [ ]
      else
        ((head list).names or [ ]) ++ values (tail list);

    unique = result: list:
      if list == [ ] then
        result
      else if builtins.elem (head list) result then
        unique result (tail list)
      else
        unique (result ++ [ (head list) ]) (tail list);
  in
    unique [ ] (values list)
