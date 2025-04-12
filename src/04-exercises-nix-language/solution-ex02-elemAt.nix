list:
  if builtins.length list < 2 then
    null
  else
    builtins.elemAt list (builtins.length list - 2)
