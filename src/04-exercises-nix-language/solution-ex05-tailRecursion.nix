# Това решение е същото като solution-ex04-recursion.nix, обаче
# функцията arithmeticProgression е дефинирана чрез опашкова рекурсия.
x: y:
  let
    arithmeticProgression = array: a1: d: n:
      if n < 1 then
        array
      else
        arithmeticProgression ([ (a1 + (n - 1) * d) ] ++ array) a1 d (n - 1);

    difference = if x < y then 1 else -1;

    abs = num: if num < 0 then num * -1 else num;
  in
    arithmeticProgression [ ] x difference (1 + abs (x - y))
