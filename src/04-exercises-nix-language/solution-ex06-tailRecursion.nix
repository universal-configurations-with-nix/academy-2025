let
  # Праввим това за удобство при добре познатите ни функции
  inherit (builtins) length head tail substring;

  # Пропуска първите два елемента
  tail2 = list:
    if length list <= 2 then
      [ ]
    else
      tail (tail list);

  appendIfValid = x: list:
    if substring 0 1 x == "B" then
      list ++ [ x ]
    else
      list;

  validStrings = result: strings:
    if strings == [ ] then
      result
    else
      validStrings (appendIfValid (head strings) result) (tail2 strings);
in
  validStrings [ ]
