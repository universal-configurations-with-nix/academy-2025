attrset:
  # Този вариант е по-удобен за намиране на проблеми, защото винаги
  # можем да заменим израза под in с някоя от тези междинни стойности
  let
    names = builtins.attrNames attrset;
    firstName = builtins.head names; # еквивалентно на builtins.elemAt names 0
    firstValue = attrset.${firstName}; # еквивалентно на builtins.getAttr firstName attrset
    hasAnyValues = builtins.length names > 0; # същото като attrset != { }
  in
    if hasAnyValues then firstValue else null
