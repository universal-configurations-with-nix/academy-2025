list:
  let
    inherit (builtins) head tail foldl';

    values = list:
      if list == [ ] then
        [ ]
      else
        ((head list).names or [ ]) ++ values (tail list);
  in
    foldl'
      (acc: string:
        if builtins.elem string acc then
          acc
        else
          acc ++ [ string ])
      [ ]
      (values list)
