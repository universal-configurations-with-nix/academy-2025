let
  func = list:
    # Когато е подаден [] или [ x ]
    if builtins.length list < 2 then
      null
    # Когато е подаден [ x y ]
    else if builtins.length list == 2 then
      builtins.head list
    # Когато е подаден [ x y z ], [ x y z a ], ...
    else
      func (builtins.tail list);
in
  func
