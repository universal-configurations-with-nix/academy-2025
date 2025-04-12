x: y:
  let
    # Припомняме от основно училище, аритметична прогресия се нарича редицата числа
    # a1, a2, a3, ..., an
    # Такива, че a2 - a1 = a3 - a2 = ... = d
    # Имаме и формулата за общия член: an = a1 + (n - 1) * d
    arithmeticProgression = a1: d: n:
      if n < 1 then
        [ ]
      else
        (arithmeticProgression a1 d (n - 1)) ++ [ (a1 + (n - 1) * d) ];

    # Ние искаме всички цели числа, следователно разликата d може да бъде 1 или -1
    difference = if x < y then 1 else -1;

    # Модул/абсолютна стойност
    abs = num: if num < 0 then num * -1 else num;
  in
    arithmeticProgression x difference (1 + abs (x - y))
