let
  func = x:
    if x <= 1 then
      null
    else if x == 2 then
      1 + x
    else
      (func (x - 1)) + x;
in
  func
