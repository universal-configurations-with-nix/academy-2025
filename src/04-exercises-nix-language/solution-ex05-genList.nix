x: y:
  let
    # Модул/абсолютна стойност
    abs = num: if num < 0 then num * -1 else num;

    sign = if x < y then 1 else -1;
  in
    builtins.genList (i: sign * i + x) (1 + abs (x - y))
