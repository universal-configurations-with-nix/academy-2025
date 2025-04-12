list:
  let
    # Праввим това за удобство и леснота на четене/писане
    inherit (builtins) length head tail substring;

    # Пропуска първите два елемента
    tail2 = list:
      if length list <= 2 then
        [ ]
      else
        tail (tail list);

    # Връщаме списък, в който всеки втори елемент е пропуснат
    evenPositioned = list:
      if list == [ ] then
        [ ]
      else
        [ (head list) ] ++ (evenPositioned (tail2 list));

    validStrings = strings:
      if strings == [ ] then
        [ ]
      else if substring 0 1 (head strings) == "B" then
        [ (head strings) ] ++ (validStrings (tail strings))
      else
        validStrings (tail strings);
  in
    validStrings (evenPositionedStrings list)
